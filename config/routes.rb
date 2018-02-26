Rails.application.routes.draw do
 
  get "articles/search"
  devise_for :users
  resources :categories
 # get 'articles/index'
   get 'welcome/index'
  root "articles#index"
  get 'welcome/contacto'

  resources :articles

end
