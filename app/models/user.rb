class User < ApplicationRecord
  validates :email, presence: true
  validates :password, presence: true
  validates :admin, presence: true

  has_secure_password
end
