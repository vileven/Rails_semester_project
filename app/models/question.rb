class Question < ApplicationRecord
  belongs_to :author, class_name: 'User'

  has_many :answers, foreign_key: :question_id, dependent: :destroy

  default_scope -> { order('created_at DESC') }

  validates :author_id, presence: true

  validates :title, presence: true, length: { maximum: 120 }

  validates :content, presence: true
end
