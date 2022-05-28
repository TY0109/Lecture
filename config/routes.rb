Rails.application.routes.draw do
  root 'static_pages#top'
  
  devise_for :users, :controllers => {
  :registrations => 'users/registrations',
  :sessions => 'users/sessions'   
  } 
  
  devise_scope :user do
    #わかりやすく再定義（併存可能）
    get "signup", :to => "users/registrations#new"
    get "login", :to => "users/sessions#new"
    get "logout", :to => "users/sessions#destroy"
  end
  
  post 'guest_login', to: "guest_sessions#create"
  post 'guest_admin_login', to: "guest_admin_sessions#create"
  
  
  resources :users, only: [:index, :show] do
    member do
      get 'favorites'
    end
  end
    
  resources :posts do
    resources :likes, only: [:create, :destroy]
    resources :comments
  end
  
  
  
end
