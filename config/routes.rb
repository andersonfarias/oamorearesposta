Rails.application.routes.draw do
	root to: 'home#index'

	namespace :admin do
    	resources :users
		root to: "users#index"
  	end
	
	devise_for :users, controllers: { sessions: 'users/sessions', passwords: 'users/passwords', confirmations: 'users/confirmations' } do
		get '/users/sign_out' => 'device/sessions#destroy'
	end

	resources :users
end