Rails.application.routes.draw do
  root to: 'topics#index'

  resources :topics, only: [:index, :show] do
    resources :conversations, only: [:show, :index] do
      collection do
        get 'active'
      end
    end
  end

  resources :users, only: [:new, :create]

  resources :sessions, only: [:new, :create, :destroy]

  get '/register', to: 'users#new'

  get '/login', to: 'sessions#new'

  post '/login', to: 'sessions#create'
end
