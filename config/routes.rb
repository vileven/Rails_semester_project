Rails.application.routes.draw do

  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :questions, only: [:new, :create, :show, :destroy, :index]
  resources :answers, only: [:create, :destroy] do
    member do
      put "like", to: "answers#like"
      put "dislike", to: "answers#dislike"
    end
  end
  resources :tags, only: [:show]

  match '/signup',  to: 'users#new',            via: 'get'
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'

  root  'static_pages#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
