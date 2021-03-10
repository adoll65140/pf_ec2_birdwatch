Rails.application.routes.draw do
  get 'users/unsubscribe'
  root 'homes#top'
  get 'homes/about' => 'homes#about', as: 'about'
  devise_for :users
  resources :users
  resources :birds
  resources :lost_birds
  resources :protection_birds
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
