Rails.application.routes.draw do
  root 'pages#home'
  resources :recipes
  get 'signup', to: 'chefs#new'
  resources :chefs, except: :new
end
