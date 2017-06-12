Rails.application.routes.draw do

  devise_for :authors
  root to: 'blog/posts#home'
 

  resources :contacts, only: [:new, :create]
 
  namespace :authors do
    get '/account' => 'accounts#edit', as: :account
    put '/info' => 'accounts#update_info', as: :info
    put '/change_password' => 'accounts#change_password', as: :change_password
    resources :posts do
      put 'publish' => 'posts#publish', on: :member
      put 'unpublish' => 'posts#unpublish', on: :member


    end
  end
  scope module: 'blog' do

    

    get 'about' => 'pages#about', as: :about
    
    resources :posts, only: [:index, :show] do
    get :search, on: :collection
   end
    get 'index' => 'posts#index', as: :index

    
    
    get 'ticket_searcht' => 'pages#ticket_search', as: :ticket_search

  end
  
end
