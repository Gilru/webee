class InfoController < ApplicationController
  before_filter :authenticate_user!, only: [:what_can_i_do]
  layout "info"
  layout "admin", only: [:what_can_i_do]

  def why_us
  end

  def pricing
  end

  def portofolio
  end

  def how_does_it_work
  end

  def what_can_i_do
  end
end
