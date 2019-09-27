Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  resources :tags
  devise_for :users
  # devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :users
  resources :categories

  resources :books do
    collection do
      get :search
    end

    resources :reviews
  end

  root 'books#index'

  get 'auth/facebook', as: "auth_provider"
  get 'auth/facebook/callback', to: 'users#login'

  resources :users, only: [:index] do
    collection do
      post :sign_in,  to: 'users#sign_in'
      post :sign_up,  to: 'users#sign_up'
      delete :sign_out,  to: 'users#sign_out'
    end
  end
end
