class User < ActiveRecord::Base

  has_secure_password

  has_many :review

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password_digest, presence: true

  public

  def self.authenticate_with_credentials(email, password)
    fixed_email = email.strip.downcase
    user = User.find_by_email(fixed_email)
    if user && user.authenticate(password)
      user
    else
    nil
    end
  end

end
