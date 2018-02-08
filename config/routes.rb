Rails.application.routes.draw do
 

 # get 'articles/index'
  root "welcome#index"
  resources :articles
end
