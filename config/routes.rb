Rails.application.routes.draw do
  get 'users/show'
  get 'trailers/show_trailers'
  devise_for :users do
    resources :reservations, except: [:new]
  end

  resources :trailers do
    resources :reservations, only: [:index]
  end

  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
