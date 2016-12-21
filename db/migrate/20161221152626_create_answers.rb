class CreateAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :answers do |t|
      t.string :content
      t.integer :answerer_id
      t.integer :question_id
      t.integer :rating

      t.timestamps
    end
    add_index :answers, [:question_id, :created_at]
  end
end
