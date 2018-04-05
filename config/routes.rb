Rails.application.routes.draw do
  devise_for :users


  root "feeds#home"

# devise_scope :user do
#     get '/users/sign_out' => 'devise/sessions#destroy'
#     get '/admin' => 'devise/sessions#new'
#   end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :messages
end
