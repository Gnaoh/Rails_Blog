Rails.application.routes.draw do

  #User Routes
 root to: 'users#index'

  get 'users', to: 'users#index', as: 'users' #use with _path

  get 'users/new', to: 'users#new', as: 'new_user'

  get 'users/create', to: 'users#create'

  get 'users/:id', to: 'users#show', as: "user_profile"

  get 'users/edit'

  get 'users/update'

  get 'users/destroy'
 

 #Session Routes
  get 'sign_in', to: 'sessions#new'

  post 'sessions', to: 'sessions#create'

 delete "sessions", to: "sessions#destroy"


  #Article Routes
  get 'articles', to: 'articles#index', as: 'articles'

  get 'articles/new', to: 'articles#new', as: 'new_article'

  get 'articles/create', to: 'articles#create'

  get 'articles/:id', to: 'articles#show', as: 'article_user_profile'

  get 'articles/:id/edit', to: 'articles#edit', as: 'edit_article'

  patch 'articles/:id', to: 'article#update'

  delete 'articles/:id', to: 'articles#destroy'


  #Site Routes
  get 'sites/index'

  get 'sites/about'

  get 'sites/contact'

  
  resources :users
  resources :articles
  resources :sites

end
