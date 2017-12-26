class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update, :destroy, :edit]

  before_action :find_commentable

  def new
    @comment = Comment.new
  end

  def create

    @comment = @commentable.comments.new(comment_params)
    @comment.user_id = current_user.id
    if @comment.save

      redirect_to @comment.post, notice: 'Your comment was successfully posted!'
    else
      redirect_to @comment.post, notice: "Your comment wasn't posted!"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :user_id)
  end

  def find_commentable
         @commentable = Comment.find_by_id(params[:comment_id]) if params[:comment_id]
         @commentable = Post.find_by_id(params[:post_id]) if params[:post_id]
         @commentable = Event.find_by_id(params[:event_id]) if params[:event_id]

  end

end
