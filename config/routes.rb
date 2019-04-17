Rails.application.routes.draw do
  root to: 'toppages#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  resources :users, only: [:index, :show, :new, :create, :edit] do
    member do
      get :followings
      get :followers
      get :likes
      post :edit
      delete :destroy
      patch :update
    end 
  end
  
  resources :microposts, only: [:create, :destroy, :edit, :show] do
    member do
      post :likes, to: 'likes#create'
      delete :unlikes, to: 'likes#destroy'
      post :edit
      get :show
      patch :update
    end 
  end
  
  resources :relationships, only: [:create,:destroy]
  resources :likes, only: [:create,:destroy] 
end
