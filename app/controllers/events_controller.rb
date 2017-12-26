class EventsController < ApplicationController
    before_action :set_event, only: [:show, :edit, :update, :destroy]

    def new
      @event = Event.new
    end

    def index
      @events = Event.all.page(params[:page]).per(2)
      @users = User.all
    end

    def show
    end

    def create
      @event = Event.create(posts_params)
      @event.user_id = current_user.id
      if @event.save
        flash[:success] = 'Post created.'
        redirect_to @event
      else
        render 'posts/new'
      end
    end

    def edit
    end

    def update
      if @event.update_attributes(posts_params)
        flash[:success] = 'The post was updated.'
        redirect_to @event
      else
        render 'posts/edit'
      end
    end

    def destroy
      if @event.destroy
        flash[:success] = 'Post deleted.'
        redirect_to root_path
      end
    end


    private

    def set_event
      @event = Event.find(params[:id])
    end

    def posts_params
      params.require(:event).permit(:title, :body, :image, :user_id, :start_event_at)
    end

end
