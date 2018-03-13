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

  post "contacts/new"
  get 'welcome/contacto'
  resources :contacts, only: [:create, :new]
  resources :articles

end
