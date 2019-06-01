class TextPost < ApplicationRecord
  belongs_to :user

  has_many :user_likes_likeables, as: :likeable,  dependent: :destroy
  has_many :users_who_liked, through: :user_likes_likeables, source: :user 

  has_many :comments, as: :post, dependent: :destroy

  validates :body, presence: true
end
