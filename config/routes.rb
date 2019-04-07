Rails.application.routes.draw do
  resources :tags
  devise_for :users
  resources :users
  resources :categories

  resources :books do
    collection do
      get :search
    end

    resources :reviews
  end

  root 'books#index'
end
