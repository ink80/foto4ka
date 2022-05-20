class Post < ApplicationRecord
  attr_accessor :image

  has_attached_file :image, styles: { medium: '300x300>', thumb: '100x100>' }, 
                            escape_url: false,
                            url: '/assets/posts/:id/:style/:basename.:extension',
                            path: ':rails_root/public/assets/posts/:id/:style/:basename.:extension'

  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }
  validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
end

