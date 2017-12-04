class User < ActiveRecord::Base
  has_secure_password
  has_many :user_destinations
  has_many :destinations, through: :user_destinations
  has_many :posts
  has_many :comments
end
