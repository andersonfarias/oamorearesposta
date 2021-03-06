Rails.application.routes.draw do

  resources :field_diaries
    authenticated :user do
        root to: 'home#index', as: :authenticated_root
    end
    root to: redirect('/users/sign_in')

    namespace :admin do
        resources :users
        root to: 'users#index'
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
        get :autocomplete_city_name, on: :collection
    end

    resources :users do
        get :autocomplete_user_name, on: :collection
    end
    resources :departments

    get 'beneficiaries/new' => 'first_contact_files#new'
    get 'beneficiaries/report' => 'beneficiaries#report'
    resources :beneficiaries, except: [:new] do
        get :autocomplete_beneficiary_name, on: :collection
    end
    
    resources :first_contact_files
    resources :evaluations
    resources :comunities
    resources :clinic_treatments
    resources :ppcls
    resources :partners do
        get :autocomplete_partner_name, on: :collection
    end
    resources :activities
    resources :field_diaries
    resources :activity_diaries
    resources :file_pictures, only: [:show, :index]
end
