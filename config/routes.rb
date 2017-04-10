Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # get "/snakes", to: "snakes#index", as: "snakes"
  # get "/snakes/:snake_id", to: "snakes#show", as: "snake"

  resources :snakes do
    resources :reviews, only: [:new, :create]
    resources :bookings
  end

  get "/users/:user_id", to: "users#show", as: "user"
  get "/users/:user_id/bookings", to: "bookings#user_show", as: "user_bookings"
  get "/users/:user_id/snakes", to: "snakes#user_show", as: "user_snakes"

  mount Attachinary::Engine => "/attachinary"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
