class Post < ActiveRecord::Base
  validates :content, presence: true, length: { in: 2..100 }
  has_many :likes, dependent: :delete_all
  belongs_to :user
  has_many :liking_users, through: :likes, source: :user
  
end
