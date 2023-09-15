class User < ApplicationRecord
  validates_presence_of :email
  validates_presence_of :password_digest, confirmation: true
  validates_uniqueness_of :email

  has_secure_password
end
