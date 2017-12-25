class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def new
    @post = Post.new
  end

  def index
    @posts = Post.all.page(params[:page]).per(2)
    @users = User.all
  end

  def show
    @new_comment = Comment.new
    @new_sub_comment = SubComment.new
  end

  def create
    @post = Post.create(posts_params)
    @post.user_id = current_user.id
    if @post.save
      flash[:success] = 'Post created.'
      redirect_to @post
    else
      render 'posts/new'
    end
  end

  def edit
  end

  def update
    if @post.update_attributes(posts_params)
      flash[:success] = 'The post was updated.'
      redirect_to @post
    else
      render 'posts/edit'
    end
  end

  def destroy
    if @post.destroy
      flash[:success] = 'Post deleted.'
      redirect_to root_path
    end
  end


  private

  def set_post
    @post = Post.find(params[:id])
  end

  def posts_params
    params.require(:post).permit(:title, :body, :image, :user_id, :post_type)
  end

end