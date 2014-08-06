class PagesController < ApplicationController
  def home
  end



#   ======================================ERRORS===================================
  def show
    render status_code.to_s, :status => status_code
  end

  protected

  def status_code
    params[:code] || 500
  end

#   ====================================ERRORS END=================================
end
