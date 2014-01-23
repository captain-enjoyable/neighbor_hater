Neighborhater::Application.routes.draw do
  resources :addresses, only: [:new, :create, :show, :index]

  root 'addresses#new'
end
