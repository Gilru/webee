Rails.application.routes.draw do

  devise_for :users
  root "pages#home"

#   =======================ERRORS=======================
  %w( 404 422 500 ).each do |code|
    get code, :to => "pages#show", :code => code
  end

#   =======================ERRORS END ==================



end
