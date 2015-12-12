Rails.application.routes.draw do

  resources :users, except: [:new, :edit]
  resources :events, except: [:new, :edit]
  root 'root#index'

end
