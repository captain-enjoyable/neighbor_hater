Neighborhater::Application.routes.draw do
  resources :locations, only: :show do
    resources :comments, only: :create
  end

  resources :addresses, only: [:new, :create]

  root 'addresses#new'
end
