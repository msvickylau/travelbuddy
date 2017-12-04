class Destination < ActiveRecord::Base
  has_many :user_destinations
  has_many :users, through: :user_destinations
  has_many :posts
end
