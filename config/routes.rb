Rails.application.routes.draw do



  resources :websites do
    resources :orders, only: [:new, :create]
  end

  resources :projects

  get 'info/why_us'
  get 'info/pricing'
  get 'info/portofolio'

  resources :blogs

  get 'users/index'

  get 'users/show'

  devise_for :users
  match 'user_root' => 'users#show', via: [:get]
  match "profile" => "users#show", :as => 'profile', via: [:get]
  match 'users/:id' => 'users#destroy', :via => :delete, as: :admin_destroy_user

  root "pages#home"

#   =======================ERRORS=======================
  %w( 404 422 500 ).each do |code|
    get code, :to => "pages#show", :code => code
  end

#   =======================ERRORS END ==================

  get 'seller' => "websites#seller"
  get 'sales' => "orders#sales"
  get 'purchases' => "orders#purchases"



end
