Rails.application.routes.draw do
  resources :pictures do
    resource :comments
  end  
  root 'pictures#index'
  devise_for :users, controllers:{registrations:'registrations'}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
