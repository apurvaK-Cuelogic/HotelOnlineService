Rails.application.routes.draw do
  get 'booking/confirmBooking'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :members
  get 'home/index'
  root 'home#index'
  get 'search/searchView'

  resources :search
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
