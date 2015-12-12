Rails.application.routes.draw do

  resources :users, except: [:new, :edit] do
    resources :events, except: [:new, :edit] do
      resources :notifications, except: [:new, :edit]
    end
  end
  root 'root#index'

end
