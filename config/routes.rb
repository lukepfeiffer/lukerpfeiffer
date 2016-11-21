Rails.application.routes.draw do
  root to: 'pages#home'

  get '/resume', to: 'pages#resume'
end
