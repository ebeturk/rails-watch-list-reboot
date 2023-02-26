Rails.application.routes.draw do
  # get 'bookmarks/new'
  # get 'bookmarks/create'
  # get 'bookmarks/destroy'
  # get 'lists/index'
  # get 'lists/new'
  # get 'lists/create'
  # get 'lists/show'
  # get 'lists/destroy'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :lists, except: [:edit, :update] do
    resources :bookmarks, only: [:new, :create]
  end
  # Defines the root path route ("/")
  root "lists#index"
  resources :bookmarks, only: :destroy, as: 'delete'
  get 'lists/create', to: 'lists#add_movies'
end
