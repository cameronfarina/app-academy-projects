Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, except: [:index]
  resource :session, only: [:new, :create, :destroy]
  resources :posts, except: [:index]
  resources :subs, except: [:destroy]
end
