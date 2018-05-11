Rails.application.routes.draw do
  root 'todos#index'
  namespace :api do
    resources :todos
  end
  
end
