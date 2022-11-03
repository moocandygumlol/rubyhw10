Rails.application.routes.draw do
  resources :inventories
  resources :users
  resources :items
  get 'shop/:id' ,to: 'main#shop'
  post 'main/buy'
  get 'main/login'
  post 'main/create'
  get 'main/destroy'
  get 'main/user_item'
  get 'main/inventories'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
