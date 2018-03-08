Rails.application.routes.draw do
  get 'booking/confirmBooking'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :members
  get 'home/index'
  root 'home#index'
  get 'search/searchView'
  get 'search/roomSearchView'

  get 'search/my_api/1'
  

  resources :search
  resources :booking
  get 'create_booking', to: 'booking#create'
  get 'view_booking_details',   to: 'booking#myBooking'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
