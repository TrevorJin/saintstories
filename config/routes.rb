Rails.application.routes.draw do
  resources :timeline_events
  get 'written_works/new'

  get 'saints/new'

  get 'password_resets/new'

  get 'password_resets/edit'

  get 'sessions/new'

  get 'users/new'

  root 'saints#map'
  get    '/help',          to: 'static_pages#help'
  get    '/about',         to: 'static_pages#about'
  get    '/signup',        to: 'users#new'
  post   '/signup',        to: 'users#create'
  get    '/login',         to: 'sessions#new'
  post   '/login',         to: 'sessions#create'
  delete '/logout',        to: 'sessions#destroy'
  get    '/map',           to: 'saints#map'
  get    '/pending_users', to: 'users#pending_users'
  
  resources :users do
    member do
      get 'approve_account'
      get 'deactivate_user'
      get 'reactivate_user'
      get 'promote_to_admin'
      get 'demote_to_user'
    end
  end
  resources :account_activations, only: [:edit]
  resources :password_resets, only:     [:new, :create, :edit, :update]
  resources :saints do
    member do
      get :following, :followers
    end
  end
  resources :relationships,       only: [:create, :destroy]
  resources :written_works
end
