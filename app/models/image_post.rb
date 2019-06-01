class ImagePost < ApplicationRecord
  belongs_to :user

  has_many :user_likes_posts, as: :post,  dependent: :destroy
  has_many :users_who_liked, through: :user_likes_posts, source: :user 

  has_many :comments, as: :post, dependent: :destroy

  has_one_attached :image
end
