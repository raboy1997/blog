class Post < ApplicationRecord
  mount_uploader :image , ImageUploader

  belongs_to :user
  has_many :comments

  Post_TYPES = [ "article", "event"]
end
