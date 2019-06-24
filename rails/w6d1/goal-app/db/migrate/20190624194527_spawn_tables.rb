class SpawnTables < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username, null: false, index: true
      t.string :session_token, null: false
      t.string :password_digest, null: false
      
      t.timestamps
    end

    create_table :goals do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.integer :user_id, null: false, index: true
    
      t.timestamps
    end

    create_table :comments do |t|
      t.text :body, null: false
      t.integer :user_id, null: false, index: true
      t.integer :goal_id, null: false, index: true
    
      t.timestamps
    end
    
  end
end
