require 'constraints'

Rails.application.routes.draw do
  root 'api/v1/todos#index'
  namespace :api do
  	scope module: :v1, constraints: ApiConstraints.new(version: 1) do
      resources :todos, :items
    end
    scope module: :v2, constraints: ApiConstraints.new(version: 2, default: true) do
      resources :todos, :items
    end
  end
  
end
