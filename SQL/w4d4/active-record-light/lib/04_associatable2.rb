require_relative '03_associatable'
require 'byebug'

# Phase IV
module Associatable
  # Remember to go back to 04_associatable to write ::assoc_options

  def has_one_through(name, through_name, source_name)
 
        define_method(name) do
          through_options = self.class.assoc_options[through_name]
          source_options = through_options.model_class.assoc_options[source_name]
          through_table = through_options.table_name 
          t_pk = through_options.primary_key
          t_fk = send(through_options.foreign_key)

          source_table = source_options.table_name
          s_fk = source_options.foreign_key 
          s_pk = source_options.primary_key 

          data = DBConnection.execute(<<-SQL, t_fk)
           SELECT
              #{source_table}.* 
            FROM
              #{through_table}
            JOIN
              #{source_table} 
            ON 
              #{through_table}.#{s_fk} = #{source_table}.#{t_pk}
            WHERE 
              #{source_table}.#{s_pk} = ?
          SQL
          
          source_options.model_class.parse_all(data.first)
        end
  end
end

    # p name -- :home 
    # p through_name -- :human
    # p source_name -- :house
    # p through_options -- BelongsToOptions Object
    # p source_options = BelongsToOptions Object
    # p source_name -- :house
    # p through_options.table_name -- "humans"
    # p through_options.table_name -- "houses"
    # p through_options.foreign_key -- :owner_id
    # p source_options.foreign_key -- :house_id
    # p source_options.primary_key -- :id
    # p through_options.table_name.foreign_key -- "humans_id" comes from here
    # p through_options.table_name.foreign_key -- "houses_id"