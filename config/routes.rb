Rails.application.routes.draw do

  devise_for :authors
  root to: 'blog/posts#index' 

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
  get :Moldova, on: :collection
   get :search, on: :collection
   end
    get 'news' => 'pages#news', as: :news
    
    get 'ukraina' => 'pages#ukraina', as: :ukraina
    get 'ticket_searcht' => 'pages#ticket_search', as: :ticket_search

  end
  
end
