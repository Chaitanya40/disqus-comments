Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :sessions, only: [:create, :destroy]

  resources :questions do 
  	resources :comments
  end

  resources :comments do 
  	resources :replies
  end		
end
