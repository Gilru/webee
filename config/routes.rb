Rails.application.routes.draw do



  resources :categories


  resources :websites do
    collection do
      get 'search'
    end
    resources :orders, only: [:new, :create] do
      collection do
        get 'search'
      end
    end
  end


  resources :projects do
    collection do
      get 'search'
    end
    resources :reviews
  end



  get 'info/why_us'
  get 'info/pricing'
  get 'info/portofolio'


  resources :blogs do
    collection do
      get 'search'
    end
  end



  get 'users/index'

  get 'search' => "users#search"



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
