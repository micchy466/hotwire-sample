class ApplicationController < ActionController::Base
  before_action :pageutil

  protected
  def pageutil
    @classname = [controller_name]
    @clog = Rails.application.config.customlogger
  end
end
