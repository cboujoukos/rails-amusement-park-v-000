Rails.application.routes.draw do
  resources :users
  resources :attractions

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  patch '/ride' => 'users#ride'

  delete '/logout' => 'sessions#destroy'

  root "welcome#home"
end
