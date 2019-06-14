require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject

  def self.columns
    return @columns if @columns

    data = DBConnection.execute2(<<-SQL)
    SELECT
      *
    FROM
      "#{self.table_name}"
    SQL

    @columns = data.first.map(&:to_sym)
  end

  def self.finalize!
    self.columns.each do |column_name|
      
      define_method(column_name) do
        self.attributes[column_name]
      end
    
      define_method("#{column_name}=") do |value|
        self.attributes[column_name] = value
      end
    end

  end

  def self.table_name=(table_name)
    @table_name = table_name
  end

  def self.table_name
    @table_name ||= self.to_s.tableize
  end

  def self.all
    data = DBConnection.execute(<<-SQL)
    SELECT *
    FROM "#{self.table_name}"
    SQL
    data.map { |hash| parse_all(hash) }
  end

  def self.parse_all(results)
      if results.is_a?(Hash)
        self.new(results)
      else
        return nil if results.nil?
        results.map {|result| self.new(result)}
      end
  end

  def self.find(id)
      data = DBConnection.execute(<<-SQL,id)
      SELECT *
      FROM "#{self.table_name}"
      WHERE id = ?
      SQL

      parse_all(data.first)
  end

  def initialize(params = {})
      params.each do |attr_name, value|
        if self.class.columns.include?(attr_name.to_sym) 
            self.send("#{attr_name}=", value)
        else
          raise "unknown attribute '#{attr_name}'"
        end
      end
  end

  def attributes
      @attributes ||= {}
  end

  def attribute_values
      @attributes.values
  end

  def insert
      n = (self.class.columns.length - 1)
      col_names = self.class.columns.drop(1).join(", ")
      question_marks = (['?'] * n).join(", ")
      args = self.attribute_values

      DBConnection.execute(<<-SQL, *args )
      INSERT INTO 
        #{self.class.table_name} (#{col_names})
      VALUES 
        (#{question_marks}) 
      SQL

      self.id = DBConnection.last_insert_row_id
  end

  def update
      col = self.class.columns
      attys = col.map { |attr| "#{attr} = ?" }.join(", ")
      col_names = self.class.columns.drop(1).join(", ")
      av = self.attribute_values
      
      DBConnection.execute(<<-SQL, *av, self.id)
      UPDATE 
        #{self.class.table_name}
      SET 
        #{attys}
      WHERE
        #{self.class.table_name}.id = ?
      SQL
  end

  def save
    if id.nil?
      self.insert
    else 
      self.update
    end
  end
end
