Todo2::Application.routes.draw do
 
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  
  root :to => "home#index"

  resources :lists do
      resources :tasks
  end

  resources :task do
    resources :categories
  end

  resources :task do
    resources :reminders
  end
end
