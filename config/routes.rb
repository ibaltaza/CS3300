Rails.application.routes.draw do
  devise_for :users
  get 'about' => 'pages#about', as: :about
  root to: 'posts#index'
  resources :posts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
