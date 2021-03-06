Rails.application.routes.draw do
  devise_for :hackers
  get '/hackers', to: redirect('/hackers/sign_up')
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'pages#home'
  resources :parents do
    resources :children, only: :create
  end

  get 'asign_crews', to: 'children#asign_crews'

  resources :children
  resources :crew_leaders
  resources :volunteers
end
