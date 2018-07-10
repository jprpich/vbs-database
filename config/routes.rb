Rails.application.routes.draw do
  devise_for :hackers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'parents#index'
  resources :parents do
    resources :children, only: :create
  end
  
  resources :children

end
