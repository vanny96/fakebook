class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable 
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, 
         :confirmable, 
         :omniauthable, omniauth_providers: %i[facebook]


  # Define associations for friendship
  has_many :friendships
  has_many :friends, through: :friendships

  # Define associations for friendship requests
  has_many :friendship_request_sent, class_name: 'FriendPendingRequest'
  has_many :pending_friends, through: :friendship_request_sent

  has_many :friendship_request_received, class_name: 'FriendPendingRequest', foreign_key: 'pending_friend_id'
  has_many :waiting_friends, through: :friendship_request_received, source: :user

  # Define associations with posts
  has_many :text_posts
  has_many :image_posts

  has_many :user_likes_posts
  has_many :liked_text_posts, through: :user_likes_posts, source: :post, source_type: 'TextPost'
  has_many :liked_image_posts, through: :user_likes_posts, source: :post, source_type: 'ImagePost'

  # Define associations with comments
  has_many :comments

  # Profile image
  has_one_attached :profile_image

  # Asks the OAuth provider for email, password and full_name
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.full_name = auth.info.name   # assuming the user model has a name
      # If you are using confirmable and the provider(s) you use validate emails, 
      # uncomment the line below to skip the confirmation emails.
      # user.skip_confirmation!
    end
  end

  # Create new user with facebook session
  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  # Own posts

  def posts
    (self.text_posts + self.image_posts).sort_by{|post| post.created_at}.reverse 
  end

  def feed
    text_posts = TextPost.where("user_id IN (?)", self.friend_ids << self.id).includes(:user)
    image_posts = ImagePost.where("user_id IN (?)", self.friend_ids << self.id).includes(:user)
    (text_posts + image_posts).sort_by{|post| post.created_at}.reverse 
  end
end
