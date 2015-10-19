Rails.application.routes.draw do
  root to: 'topics#index'

  resources :topics, only: [:index, :show] do
    resources :conversations, only: [:show, :index] do
      collection do
        get 'active'
      end
    end
  end

  # resources :users, only: [:new, :create]
  get '/register', to:'users#register'
  post '/register', to:'users#signup'

  get '/login', to: 'users#login'
  post '/login', to: 'users#auth'
end
