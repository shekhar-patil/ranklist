

Rails.application.routes.draw do
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