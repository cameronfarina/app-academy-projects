Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resource :session, only: [:create, :new, :destroy]
  
  resources :users, only: [:create, :new, :show]

  resources :bands do
    resources :albums, only: [:new]
  end
  
  resources :albums, only: [:create, :edit, :show, :destroy, :update] do
    resources :tracks, only: [:new]
  end

  resources :tracks, only: [:create, :edit, :show, :update, :destroy]

  resources :notes, only: [:create, :destroy]
end
