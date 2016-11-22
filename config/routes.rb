Rails.application.routes.draw do
  root to: 'pages#home'

  resources :posts

  get '/resume', to: 'pages#resume'
  get '/contact', to: 'pages#contact'
  get '/projects', to: 'pages#projects'
  get '/sign_in', to: 'pages#sign_in'

  post '/sign_in', to: 'sessions#create'

  delete '/sign_out', to: 'sessions#destroy'

end
