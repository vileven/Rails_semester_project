class CreateLikes < ActiveRecord::Migration[5.0]
  def change
    create_table :likes do |t|
      t.integer :user_id
      t.integer :answer_id

      t.timestamps
    end
    add_index :likes, :user_id
    add_index :likes, :answer_id
    add_index :likes, [:user_id, :answer_id], unique: true
  end
end
