class Tag < ApplicationRecord

  has_and_belongs_to_many :questions, class_name: 'Question', counter_cache: true

  # scope :top, order('questions_count DESC')

  validates :name, presence: true
end
