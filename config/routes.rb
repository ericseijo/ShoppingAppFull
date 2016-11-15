Rails.application.routes.draw do
  get 'dashboard', to: 'user_dashboard#index', as: 'user_dashboard'

  resources :products
  resources :shopping_lists
  
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  
  root to: 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
