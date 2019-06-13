class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
        t.integer :poll_id, null: false
        t.text :body, null: false

        t.timestamps
    end

      add_index :questions, :body
  end
end
