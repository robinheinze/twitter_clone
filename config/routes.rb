TwitterClone::Application.routes.draw do
  devise_for :users
  resources :follows, :only => [:create, :new, :destroy ]
  resources :users, :only => [:show] do
    resources :chirps
  end
  root :to => 'application#index'
end
