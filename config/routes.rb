Rails.application.routes.draw do
  get 'users/new'

  devise_for :users
  root to: "home#index"
  resources :dashboard
  resources :posts do 
  	resources :comments
  end
  resources :projects
  match '/edit' => 'home#edit', :as => :edit, :via => [:get, :post]
  get 'posts/index'
  get 'projects/index'
  get 'projects/add_members'
  match ':controller(/:action(/:id))', :via => [:get, :post]
  #get 'projects/show'
  #match '/index' => 'posts#index', :as => :edit, :via => [:get, :post]
end
