Rails.application.routes.draw do

  root 'posts#static'
  get 'posts', to: 'posts#index'
  devise_for :users

  resources :posts do
    resources :comments
  end

  resources :events do
    resources :comments
  end

  resources :comments do
    resources :comments
  end


  post '/create/sub_comment' , to: 'sub_comments#create' , as: 'create_sub_comment'
  # get '/comment/:id/edit' , to: 'comments#edit' , as: 'comment_edit'
  patch '/posts/:post_id/comments/:comment_id/edit' , to: 'comments#update' , as: 'update_comment'
  get 'edit/sub_comment/:sub_comment_id' , to: "sub_comments#edit" , as: 'edit_sub_comment'
  patch '/edit/sub_comment/:sub_comment_id' , to: 'sub_comments#update' , as: 'update_sub_comment'
  delete '/delete/sub_comment/:id' , to: 'sub_comments#destroy' , as: 'destroy_sub_comment'

end
