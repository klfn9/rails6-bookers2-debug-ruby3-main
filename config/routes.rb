Rails.application.routes.draw do

  get 'comments/create'
  get 'comments/destroy'
  get 'favorites/create'
  root to: "homes#top"
  get "home/about"=>"homes#about"
  devise_for :users
  resources :users, only: [:index,:show,:edit,:update]
  resources :books do
   resource :favorites, only: [:create, :destroy]
 end
 resources :books, except: [:index] do
    resources :comments, only: [:create, :destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
