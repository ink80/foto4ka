class User < ApplicationRecord
  enum role: %i[user vip admin], _suffix: :role

  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy

  has_many :follower_relationships,
           foreign_key: :following_id,
           class_name: 'Follow'

  has_many :followers, through: :follower_relationships, source: :follower

  has_many :following_relationships,
           foreign_key: :follower_id,
           class_name: 'Follow'

  has_many :following, through: :following_relationships, source: :following

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_attached_file :avatar, styles: { medium: '300x300>', thumb: '100x100#' },
                             default_url: '/images/:style/missing.png'
  validates_attachment_content_type :avatar, content_type: %r{\Aimage/.*\Z}

  def follow(user_id)
    following_relationships.create(following_id: user_id)
  end

  def unfollow(user_id)
    following_relationships.find_by(following_id: user_id).destroy
  end

  def following?(user_id)
    following.include?(user_id)
  end
end
