Rails.application.routes.draw do
  devise_for :users

  resources :books do
    collection do
      get :search
    end

    resources :reviews
  end

  root 'books#index'
end
