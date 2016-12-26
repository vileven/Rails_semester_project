class Question < ApplicationRecord
  belongs_to :author, class_name: 'User'

  has_many :answers, foreign_key: :question_id, dependent: :destroy, counter_cache: true

  has_and_belongs_to_many :tags

  default_scope -> { order('created_at DESC') }

  validates :author_id, presence: true

  validates :title, presence: true, length: { maximum: 120 }

  validates :content, presence: true


  def self.search(search)
    if search
      Question.where('title LIKE ?', "%#{search}%")
    else
      Question.all
    end
  end
end
