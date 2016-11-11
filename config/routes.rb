Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'contacts#index'

  get '/fetch_contacts' => 'contacts#from_group', as: 'fetch_contacts'
  get '/fetch_all' => 'contacts#all', as: 'fetch_all'
  
  resources :contacts
  resources :groups



end
