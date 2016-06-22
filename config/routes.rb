Rails.application.routes.draw do

	authenticated :user do
		root to: 'home#index', as: :authenticated_root
	end
	root to: redirect('/users/sign_in')

	namespace :admin do
		resources :users
		root to: "users#index"
	end

	get '/users/sign_up' => 'users#new'
	post '/users' => 'users#create'
	put '/users' => 'users/registrations#update'

	devise_for :users, controllers: { sessions: 'users/sessions', passwords: 'users/passwords', confirmations: 'users/confirmations' } do
		get '/users/sign_out' => 'device/sessions#destroy'
		post '/users/password' => 'users/passwords#create'
		put '/users/password' => 'users/passwords#update'
		get '/users/password/edit' => 'users/passwords#edit'
	end

	resources :users
	resources :departments
	resources :people
	resources :states
	resources :first_contact_files
end
