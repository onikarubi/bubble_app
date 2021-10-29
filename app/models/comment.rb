class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :article

  validates :comment_content, presence: true
  mount_uploader :image, ImageUploader
end
