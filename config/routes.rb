Rails.application.routes.draw do

  resources :projects

  get 'info/why_us'
  get 'info/pricing'
  get 'info/portofolio'

  resources :blogs

  get 'users/index'

  get 'users/show'

  devise_for :users
  root "pages#home"

#   =======================ERRORS=======================
  %w( 404 422 500 ).each do |code|
    get code, :to => "pages#show", :code => code
  end

#   =======================ERRORS END ==================



end
