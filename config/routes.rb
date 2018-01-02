Rails.application.routes.draw do
  root 'welcome#index'

  namespace :admin do
    get '/', to: 'sessions#index'
    get 'login', to: 'sessions#new'
    post 'login', to: 'sessions#create'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
