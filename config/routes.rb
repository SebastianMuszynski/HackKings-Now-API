Rails.application.routes.draw do

  resources :users,    except: [:new, :edit]
  resources :events, except: [:new, :edit] do
    post '/subscribe', to: 'events#subscribe', on: :collection
    resources :notifications, except: [:new, :edit]
    resources :messages,      except: [:new, :edit]
  end
  root 'root#index'

end
