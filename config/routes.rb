Rails.application.routes.draw do
  get 'topics/new'
  get 'sessions/new'
  
  root 'pages#index'
  get 'pages/help'
  
  resources :users

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  
  resources :users
  resources :topics do #コメント機能実装
    resources :comments
  end
  
  get 'favorites/index'
  post '/favorites', to: 'favorites#create'
  delete '/favorites', to: 'favorites#destroy'
end
