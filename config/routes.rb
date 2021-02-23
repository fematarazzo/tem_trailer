Rails.application.routes.draw do
  devise_for :users do
    resources :reservations, only: [:index, :create]
  end

  resources :trailers do
    resources :reservations, only: [:index, :create]
  end

  resources :reservations, only: [:show]

  resource :profiles, only: [:show]

  resources :user_trailers, only: [:index, :show]

  root to: 'pages#home'
end
