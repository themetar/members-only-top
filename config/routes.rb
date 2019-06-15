Rails.application.routes.draw do
  root to: 'posts#index'
  resources :posts, only: [:new, :create, :index]
  get    '/login', to: 'sessions#new'
  post   '/login', to: 'sessions#create'
  delete '/login', to: 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
