class User < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email, null: false

      t.timestamps
    end
      add_index :users, :email, unique: true
      add_index :users, :name
  end
end
