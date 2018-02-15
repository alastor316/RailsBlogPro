Rails.application.routes.draw do
 

  resources :categories
 # get 'articles/index'
   get 'welcome/index'
  root "articles#index"
  get 'welcome/contacto'
  resources :articles

end
