Rails.application.routes.draw do
  root to: 'pages#resume'

  resources :posts

  get '/resume', to: 'pages#resume'
  get '/contact', to: 'pages#contact'
  get '/sign_in', to: 'pages#sign_in'
  get 'archived', to: 'posts#archived'

  post '/sign_in', to: 'sessions#create'

  delete '/unarchive', to: 'posts#unarchive'
  delete '/archive', to: 'posts#archive'
  delete '/sign_out', to: 'sessions#destroy'

end
