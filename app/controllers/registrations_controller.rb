class RegistrationsController < ApplicationController
  protected

  def after_sign_up_path_for(resource)
    projects_path
  end


end
