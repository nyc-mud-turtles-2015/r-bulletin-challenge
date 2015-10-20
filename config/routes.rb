Rails.application.routes.draw do
  resources :users, only: [:show,:new,:create]

  resources :categories, only: [:index, :show] do
    resources :topics, only: [:index, :show]
  end
## how do i get rid of this routing on line 10? I just wanted
## topic/:id/conversations/:id nesting but not the routes for /topics
## cluttering the routing info
  resources :topics, only: [:index, :show] do
    resources :conversations, except: [:edit,:update,:destroy] do
      collection do
        get :latest
      end
    end
  end

  resources :conversations, only: [:show] do
    resources :messages, only: [:index,:create,:new]
  end

  get 'register' => 'users#new', as: 'register'
  post 'register' => 'users#create'
  get 'login' => 'sessions#login_form'#, as: 'login'
  post 'login' => 'sessions#login'
  get 'logout' => 'sessions#logout', as: 'logout'
end
