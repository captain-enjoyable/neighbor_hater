Neighborhater::Application.routes.draw do
  resources :addresses, only: [:new, :create, :show, :index] do
  	resources :comments, only: [:create]
  end
  root 'addresses#new'
end
