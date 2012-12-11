Todo2::Application.routes.draw do
 
  devise_for :users
  
  root :to => "home#index"

  resources :lists do
      resources :tasks
  end
end
