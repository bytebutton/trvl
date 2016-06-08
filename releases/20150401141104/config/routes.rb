TravelLink::Application.routes.draw do

  require 'sidekiq/web'

  mount Sidekiq::Web => '/sidekiq'
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  devise_for :users, :controllers => { :sessions => 'auth/sessions', :registrations => 'auth/registrations' }

  devise_scope :user do
    root :to => 'auth/sessions#new'
  end

  resources :wizard, :only => [:show, :update]
  resources :passport_requests
  resources :users, :only => [:update, :edit]
  resources :secure_messages, :request_callbacks, :only => [:create]

  namespace :manager do
    resources :companies, :only => [:index, :show] do
      resources :visas, :trips, :passports, :module => :companies, :only => :index
      resources :users,                     :module => :companies, :only => [:index, :update, :edit]
    end
  end

  resources :trips do

    collection do
      get :current
      get :upcoming
      get :previous
      get :deleted
    end

    member do
      get :finish
      put :set_as_current
    end

  end

  resources :visas do
    get :my, :on => :collection
  end

  get 'passport/assistance' => 'passports#assistance'
  resources :passports do
    get :my, :on => :collection
  end

  namespace :api do
    namespace :v1 do
      resource :trips do
        get :available_dates
      end
      resource :visas do
        get :available_visas
      end
    end
  end

  get 'contact'  => 'contact#index'

  match  'uploads/image',   :constraints => {:format => 'json'}, :via => %w(post patch put)
  delete 'uploads/destroy', :constraints => {:format => 'json'}

end
