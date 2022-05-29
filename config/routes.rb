Rails.application.routes.draw do
  root 'static_pages#top'
  
  devise_for :users, :controllers => {
  :registrations => 'users/registrations',
  :sessions => 'users/sessions',
  :omniauth_callbacks => "omniauth_callbacks"
  } 
  
  devise_scope :user do
    #わかりやすく再定義（併存可能）
    get "signup", :to => "users/registrations#new"
    get "login", :to => "users/sessions#new"
    get "logout", :to => "users/sessions#destroy"
    
    #ゲストログインを新たに追加
    post 'guest_login', to: 'users/sessions#create_guest'
    post 'guest_admin_login', to: 'users/sessions#create_guest_admin'

  end
  
  
  resources :users, only: [:index, :show, :destroy] do
    member do
      get 'favorites'
    end
  end
    
  resources :posts do
    resources :likes, only: [:create, :destroy]
    resources :comments
  end
  
  
  
end
