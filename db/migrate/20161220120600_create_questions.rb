class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      t.string :title
      t.string :content
      t.integer :answers_count, default: 0
      t.integer :author_id

      t.timestamps
    end
    add_index :questions, [:author_id, :created_at]
  end
end
