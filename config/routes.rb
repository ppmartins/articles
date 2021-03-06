Rails.application.routes.draw do

  devise_for :users

  root to: "articles#index"

  resources :topics do
    resources :articles do
      resources :comments, only: [:create, :destroy]
    end
  end
end
