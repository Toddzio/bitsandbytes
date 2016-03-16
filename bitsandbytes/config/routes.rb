Rails.application.routes.draw do
  resources :boards do
  resources :entries
end

  devise_for :users
  root 'boards#index'
end
  
