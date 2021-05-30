Rails.application.routes.draw do
  resources :pictures do
    resource :comments
    member do
      put 'like', to: "pictures#like"
      put 'unlike', to: "pictures#unlike"
    end
  end  
  root 'pictures#index'
  devise_for :users, controllers:{registrations:'registrations'}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
