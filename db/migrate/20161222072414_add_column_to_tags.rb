class AddColumnToTags < ActiveRecord::Migration[5.0]
  def change
    add_column :tags, :question_count, :integer, default: 0
    add_index :tags, :question_count
  end

end
