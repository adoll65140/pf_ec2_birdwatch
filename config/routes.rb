Rails.application.routes.draw do
  get 'birds/index'
  get 'birds/edit'
  get 'birds/show'
  get 'birds/new'
  get 'users/show'
  get 'users/edit'
  get 'users/unsubscribe'
  root 'homes#top'
  get 'homes/about' => 'homes#about', as: 'about'
  devise_for :users
  resources :users
  resources :birds
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
