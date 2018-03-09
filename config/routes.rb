

Rails.application.routes.draw do


  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'welcome/index'


  resources :posts do
    resources :lists do
      post 'upvote' => 'lists#upvote'
      post 'downvote' => 'lists#downvote'
    end
    resources :comments
  end
  
 
  root 'posts#index'
end