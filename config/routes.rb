Rails.application.routes.draw do
  resources :profiles

  devise_for :users
  resources :posts
  get 'home/index'

  root to: "home#index"
  resources :channels
  resources :posts do
    member do
      get 'upvote'
      get 'downvote'
    end
    resources :comments
      member do
        get 'upvote'
        get 'downvote'
      end
  end
 

  resources :comments do
    member do
      get 'upvote'
      get 'downvote'
    end
    resources :comments
    #member do
    #   get 'upvote'
    #   get 'downvote'
    # end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
