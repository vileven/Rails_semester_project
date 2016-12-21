class ChangeRatingColumnInAnswers < ActiveRecord::Migration[5.0]
  def change
    change_column :answers, :rating, :integer,  default: 0
  end
end
