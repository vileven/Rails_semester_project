class User < ApplicationRecord
  before_save { self.email = email.downcase }
  before_create :create_remember_token

  has_many :questions, foreign_key: :author_id, dependent: :destroy
  has_many :answers, foreign_key: :answerer_id, dependent: :destroy
  has_many :likes, foreign_key: :user_id, dependent: :destroy
  has_many :liked_answers, through: :likes, source: :answer, dependent: :destroy

  validates :name, presence: true, length: { maximum: 50 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false }

  has_secure_password
  validates :password, length: { minimum: 6 }


  mount_uploader :avatar, AvatarUploader

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  def likes?(answer)
    likes.find_by(answer_id: answer.id)
  end

  def like!(answer)
    likes.create!(answer_id: answer.id)
  end

  def dislike!(answer)
    likes.find_by(answer_id: answer.id).destroy!
  end

  private

  def create_remember_token
    self.remember_token = User.encrypt(User.new_remember_token)
  end

end
