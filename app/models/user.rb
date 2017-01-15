class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :age, presence: true
  validates :phone, presence: true

  has_secure_password

  def full_name
    first_name ? first_name + ' ' + last_name : email
  end

end
