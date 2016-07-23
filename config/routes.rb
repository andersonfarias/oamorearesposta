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
	patch '/users/:id' => 'users/registrations#change_user'

	devise_for :users, controllers: { sessions: 'users/sessions', passwords: 'users/passwords', confirmations: 'users/confirmations' } do
		get '/users/sign_out' => 'device/sessions#destroy'
		post '/users/password' => 'users/passwords#create'
		put '/users/password' => 'users/passwords#update'
		get '/users/password/edit' => 'users/passwords#edit'
	end

	resources :cities do
	  get :autocomplete_city_name, :on => :collection
	end

	resources :users
	resources :departments
	get 'beneficiaries/new' => 'first_contact_files#new'
	resources :beneficiaries, except: [:new]
	resources :first_contact_files
  resources :comunities
	resources :clinic_treatments, only: [:new, :create]
	resources :partners
end
