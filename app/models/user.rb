class User < ApplicationRecord
  # validates_presence_of :email
  # validates_uniqueness_of :email
  # validates :email, absence: { message: "can't be nil" }, unless: -> { email.nil? }
  # validates :sgid, absence: { message: "can't be nil" }, unless: -> { sgid.nil? }
end
