Rails.application.routes.draw do
  get 'homepage/index'
  root 'homepage#index'
  get 'doctors/main', to: 'doctors#main'
  resources :doctors, :patients, :specializations, :appointments


######### DOCTORS NON RESOURCEFUL ROUTES #########

#  get 'doctors/new', to: 'doctors#new'
#  get 'doctors/:id', to: 'doctors#show', as: :doctor
#  get 'doctors', to: 'doctors#index', as: :doctors 
#  get 'doctors/:id/edit', to: 'doctors#edit', as: :edit_doctor
#  post 'doctors', to: 'doctors#create'
#  patch 'doctors/:id', action: :update, controller: :doctors, id: :doctor
#      patch 'doctors/:id', to: 'doctor#update', id: :doctor
#      put 'doctors/:id', to: 'doctor#update'
#      match '/doctors/:id' => redirect('/doctors/%{id}'), via: [:patch]
#  delete 'doctors/:id', action: :destroy, controller: :doctors, id: :doctor
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
end
