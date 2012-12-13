Todo2::Application.routes.draw do
 
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  match "lists/:list_id/tasks/:id/change_status" => "complete_task#change_status", :as => :complete_task
  
  root :to => "home#cosa"

  root :to => "home#index"

  resources :lists do
      resources :tasks
  end

  resources :categories

  resources :task do
    resources :reminders
  end
  
end
