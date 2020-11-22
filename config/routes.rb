Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :buildings, only: [:index, :edit, :update, :show]
  resources :companies, only: [:index, :new, :edit, :show, :create]
  resources :employees, only: [:index, :create, :destroy]
end
