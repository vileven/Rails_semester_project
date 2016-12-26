class AddColumnToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :question_count, :integer, default: 0
    add_index :users, :question_count
  end
end
