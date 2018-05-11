Rails.application.routes.draw do
  root 'api/todos#index'
  namespace :api do
    resources :todos
  end
  
end
