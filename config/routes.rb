Rails.application.routes.draw do
  root to: 'pages#home'
  # get "/snakes", to: "snakes#index", as: "snakes"
  # get "/snakes/:snake_id", to: "snakes#show", as: "snake"
  devise_for :users,
  controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :snakes do
    resources :bookings
    resources :reviews, only: [:new, :create, :show]
  end
  #   resources :bookings do
  #   resources :reviews, only: [:new, :create]
  # end
  get "/users/:user_id", to: "pages#show", as: "user"
  get "/users/:user_id/bookings", to: "bookings#user_show", as: "user_bookings"
  get "/users/:user_id/snakes", to: "snakes#user_show", as: "user_snakes"

  mount Attachinary::Engine => "/attachinary"



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

