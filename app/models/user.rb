class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password, presence: true, length: {minimum: 4}
  validates :password_confirmation, presence: true
  
  def self.authenticate_with_credentials(email, password)
    @user = User.find_by("LOWER(email) = ?", email.strip.downcase)
    @user && @user.authenticate(password) || nil
  end

end

