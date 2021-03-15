Rails.application.routes.draw do

  get 'posts/mypage' => 'posts#mypage', as: 'mypage'
  get 'users/unsubscribe'
  root 'homes#top'
  get 'homes/about' => 'homes#about', as: 'about'
  devise_for :users
  resources :users
  resources :birds do
    resources :bird_comments, only: [:create, :destroy]
    resource :bird_checks, only: [:create, :destroy]
  end
  resources :lost_birds do
    resources :lost_bird_comments, only: [:create, :destroy]
    resource :lost_checks, only: [:create, :destroy]
  end
  resources :protection_birds do
    resources :protection_bird_comments, only: [:create, :destroy]
    resource :protection_checks, only: [:create, :destroy]
  end
  resources :adoptions
  resources :items
  resources :posts do
    resources :post_comments, only: [:create, :destroy]
    resource :likes, only: [:create, :destroy]
  end
  resources :genres
  resources :breeds
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
