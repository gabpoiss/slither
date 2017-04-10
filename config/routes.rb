Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get "/snakes", to: "snakes#index", as: "snakes"
  get "/snakes/:snake_id", to: "snakes#show", as: "snake"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
