require "bcrypt"

class User < ApplicationRecord
  acts_as_paranoid

  has_many :videos
  has_many :preferences

  validates_presence_of :username, :email
  validates_uniqueness_of :username, :email
  validates_confirmation_of :password

  has_secure_password
end
