class User < ApplicationRecord
  validates :email, presence: true
  validates :password, presence: true
  validates :admin, presence: true
end
