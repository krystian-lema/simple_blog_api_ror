Rails.application.routes.draw do
  resources :tags
  resources :comments
  resources :articles
  resources :authors
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
