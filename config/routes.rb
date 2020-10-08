Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'scenarios#index'
  resources :scenarios, only: %i[index show new create]
  resources :players, only: %i[index show] do
    get 'bookmarks'
    get 'my_scenarios'
    get 'followers'
    get 'followings'
  end
  resources :bookmarks, only: %i[create destroy]
  resources :reviews, only: %i[create edit destroy]
  resources :follow_relationships, only: [:create, :destroy]

  get '/auth/:provider/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
end
