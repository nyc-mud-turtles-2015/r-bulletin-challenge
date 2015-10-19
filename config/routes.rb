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
end
