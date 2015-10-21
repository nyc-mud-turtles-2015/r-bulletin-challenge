Rails.application.routes.draw do
  namespace :api do
    resources :topics, only: [:index, :show] do
      resources :conversations, only: [:index, :show]
    end

    resources :messages, only: [:create]
    resource :sessions, only: [:create]
  end

  resource :sessions, only: [:create]
  resource :users, only: [:create]
  resources :topics, only: [:index, :show] do
    resources :conversations, only: [:index, :show]
  end

  resources :messages, only: [:create]

  get 'conversations' => 'conversations#recent'
  root 'topics#index'
  get 'register' => 'users#new'
  get 'logout' => 'sessions#destroy'
  get 'login' => 'sessions#new'

  get 'handlebars' => 'handlebars#show'
end
