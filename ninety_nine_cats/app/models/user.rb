class User < ApplicationRecord
  before_validation :ensure_session_token
  validates :user_name, :session_token, :password_digest, uniqueness: :true, presence: :true
  validates :password, length: { minimum: 6 }, allow_nil: true 

  # after_initialize 

  attr_reader :password

  def reset_session_token!
    self.session_token = SecureRandom::urlsafe_base64(16)
    self.save!
    self.session_token
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def self.find_by_credentials(user_inputed_username, password)
    user = User.find_by(user_name: user_inputed_username)
  
    if user && user.is_password?(password)
      return user 
    end
    nil 
  end

  def ensure_session_token
    self.session_token ||= SecureRandom::urlsafe_base64
  end
end
