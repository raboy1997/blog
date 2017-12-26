class Post < ApplicationRecord
  mount_uploader :image , ImageUploader

  belongs_to :user
  has_many :comments, as: :commentable

  validates :title, :image, :body, presence: true



end
