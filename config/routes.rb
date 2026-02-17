Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'tweets/:tweet_id/likes' => 'likes#create'#追記
  get 'tweets/:tweet_id/likes/:id' => 'likes#destroy'#追記
  resources :tweets
  resources :tweets do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create]
 end
 root 'tweets#index'
 get "reset_tags_12345", to: "tweets#reset_tags"
 get "seed_tags_12345", to: "tweets#seed_tags"
 resources :users, only: [:show]
end