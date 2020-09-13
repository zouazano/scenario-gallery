Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'scenarios#index'
  resources :scenarios, only: %i[index show]
  resources :players, only: %i[show]
  resources :bookmarks, only: %i[create destroy]

  get '/auth/:provider/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
end
