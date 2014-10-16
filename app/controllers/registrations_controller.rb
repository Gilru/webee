class RegistrationsController < ApplicationController
  protected

  def after_sign_up_path_for(resource)
    what_can_i_do_path
  end


end
