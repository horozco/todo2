Todo2::Application.routes.draw do


  root :to => "home#index"

  devise_for :users

  resources :lists do
      resources :tasks
  end
  

end
