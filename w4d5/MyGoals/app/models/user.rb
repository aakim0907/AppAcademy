class User < ApplicationRecord
  validates :name, :session_token, :password_digest, presence: true
  validates :session_token, :password_digest, uniqueness: true
  validates :password, length: { minimum: 6, allow_nil: true }
  after_initialize :ensure_session_token

  has_many :goals
  has_many :comments

  attr_reader :password

  def self.find_by_credentials(name, password)
    user = User.find_by(name: name)

    return nil if user.nil?
    user && user.is_password?(password) ? user : nil
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def reset_session_token!
    self.session_token = SecureRandom.urlsafe_base64
    self.save!
    self.session_token
  end

  private

  def ensure_session_token
    @session_token ||= SecureRandom.urlsafe_base64
  end
end
