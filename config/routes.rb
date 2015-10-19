Rails.application.routes.draw do
  root to: 'topics#index'

  resources :topics, only: [:index, :show] do
    resources :conversations, only: [:show, :index]
  end
end
