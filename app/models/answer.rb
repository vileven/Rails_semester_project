class Answer < ApplicationRecord

  belongs_to :answerer, class_name: "User"
  belongs_to :question, class_name: "Question"

  default_scope -> { order('created_at DESC') }

  validates :question_id, presence: true
  validates :answerer_id, presence: true
  validates :content, presence: true
end
