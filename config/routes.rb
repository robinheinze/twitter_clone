TwitterClone::Application.routes.draw do
  devise_for :users

  resources :users, :only => [:show] do
    resources :chirps
  end
  root :to => 'application#index'
end
