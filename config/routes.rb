Rails.application.routes.draw do
  
  resources :dogs do
    resources :dog_actions
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
