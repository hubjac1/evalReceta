class HomeController < ApplicationController

  def index
    @google_analytics_id = Rails.application.config.google_analytics_id
  end
end