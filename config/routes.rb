Rails.application.routes.draw do
  resources :tags
  resources :comments
  resources :articles
  get '/articles_include_all_data', to: 'articles#include_all_data'
  resources :authors
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
