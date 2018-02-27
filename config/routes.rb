Rails.application.routes.draw do
 
  get "articles/search"
  
  devise_for :users, controllers: {
    registrations: "users/registrations",
    sessions: "users/sessions",
    passwords: "user/password",
  }
  resources :categories
 # get 'articles/index'
   get 'welcome/index'
  root "articles#index"
  get 'welcome/contacto'

  resources :articles

end
