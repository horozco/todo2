Todo2::Application.routes.draw do
  
  get "home/index"

  root :to => "home#index"

  resources :lists do
      resources :tasks
  end
  

end
