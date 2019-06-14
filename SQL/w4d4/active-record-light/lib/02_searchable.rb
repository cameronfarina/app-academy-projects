require_relative 'db_connection'
require_relative '01_sql_object'

module Searchable
  def where(params)
    attys = params.keys.map { |key| "#{key} = ?" }.join(" AND ")
    av = params.values

    data = DBConnection.execute(<<-SQL, *av)
    SELECT 
        *
    FROM
      #{self.table_name}
    WHERE
      #{attys} 
    SQL
   parse_all(data)
  end
end

class SQLObject
    extend Searchable
end