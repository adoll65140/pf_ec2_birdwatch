Rails.application.routes.draw do
  get 'posts/mypage' => 'posts#mypage', as: 'mypage'
  get 'users/unsubscribe'
  root 'homes#top'
  get 'homes/about' => 'homes#about', as: 'about'
  devise_for :users
  resources :users
  resources :birds do
    resources :bird_comments, only: [:create, :destroy]
  end
  resources :lost_birds do
    resources :lost_bird_comments, only: [:create, :destroy]
  end
  resources :protection_birds do
    resources :protection_bird_comments, only: [:create, :destroy]
  end
  resources :posts do
    resources :post_comments, only: [:create, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
