class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable, :validatable,:rememberable, 
          :jwt_authenticatable, jwt_revocation_strategy: self
  validates :first_name, presence: true, length: {minimum:2,maximum: 50}
  validates :last_name, presence: true, length: {minimum:2,maximum: 50}
  validates :password, presence: true, length: {minimum:8,maximum: 36}
  validate :password_complexity
  validate :email_domain
  APPROVED_DOMAINS = %w[gmail.com yahoo.com hotmail.com outlook.com aol.com]

  def password_complexity
    if password.present? and not password.match("^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{8,}$")
      errors.add :password, "must include at least one lowercase letter, one uppercase letter, and one digit"
    end
  end


  def email_domain
    unless APPROVED_DOMAINS.any? {|word| email.end_with?(word)}
      errors.add :email, "is not from an approved domain"
    end
  end

end
