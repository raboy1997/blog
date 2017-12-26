class Comment < ApplicationRecord

  belongs_to :commentable, polymorphic: true
  has_many :comments, :as => :commentable

  validates :body, presence: true

  def post
    return @post if defined?(@post)
    @post = commentable.is_a?(Post) ? commentable : commentable.post
  end

end
