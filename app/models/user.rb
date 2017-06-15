class User < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged
  mount_uploader :avatar, AvatarUploader
  attr_accessor :remember_token
  before_save { email.downcase! }
  validates :name, presence: true, length: { minimum: 6, maximum: 255 }
  VALID_EMAIL_REGEX =  /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 255}, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :phone, length: {maximum: 14, minimum: 10}, allow_nil: true

  has_secure_password
  validates :password, presence: true, length: { minimum: 6, maximum: 255 }, allow_nil: true
  enum status: {Owner: 0, Admin: 1, Employee: 2}
  enum gender: {Male: 0, Female: 1, Not_sure: 2}

  validates_processing_of :avatar
  validate :avatar_size_validation

  class << self
    def digest(string)
      cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
      BCrypt::Password.create(string, cost: cost)
    end

    # Return a random token.
    def new_token
      SecureRandom.urlsafe_base64
    end
  end

  # Remembers a user in the database for use in persistent sessions.
  def remember
    self.remember_token = User,new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  def forget
    update_attribute(:remember_digest, nil)
  end

  private
    def avatar_size_validation
      errors[:avatar] << "Should be less than 5MB" if avatar.size > 5.megabytes
    end

end
