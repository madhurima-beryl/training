Rails.application.routes.draw do
  get 'welcome/index'
  root 'welcome#index'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users#, :only =>[:show]
  get 'welcome/toc', to: 'welcome#toc'
  resources :users
end
