class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post, polymorphic: true

  has_many :user_likes_likeables, as: :likeable,  dependent: :destroy
  has_many :users_who_liked, through: :user_likes_likeables, source: :user 

  validates :body, presence: true
end
