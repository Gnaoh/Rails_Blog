Rails.application.routes.draw do

  #User Routes

  get 'users', to: 'users#index', as: 'users' #use with _path

  get 'sign_up', to: 'users#new', as: 'new_user'

  get 'users/create', to: 'users#create'

  get 'users/:id', to: 'users#show', as: "user_profile"

  get 'users/edit'

  get 'users/update'

  get 'users/destroy'
 

 #Session Routes
  get 'sign_in', to: 'sessions#new'

  post 'sessions', to: 'sessions#create'

 delete 'sessions', to: "sessions#destroy"


  #Article Routes
  get 'articles', to: 'articles#index', as: 'articles'

  get 'articles/new', to: 'articles#new', as: 'new_article'

  get 'articles/:id', to: 'articles#show', as: 'article'

  get 'articles/:id/edit', to: 'articles#edit', as: 'edit_article'

  post 'articles', to: 'articles#create'

  patch 'articles/:id', to: 'articles#update'

  delete 'articles/:id', to: 'articles#destroy'


  #Site Routes
  root to: 'sites#index'

  get 'sites/about'

  get 'sites/contact'

  
  resources :users
  resources :articles
  resources :sites

end
