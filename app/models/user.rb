class User < ActiveRecord::Base
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :name, :alias, presence: true, length: { in: 2..20 }
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }  
  validates :password, presence: true, on:create
  has_many :likes
  has_many :posts
  has_many :liked_posts, through: :likes, source: :post
  has_secure_password
end
