class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # before_filter :setup_gon
  #
  # def setup_gon
  #   gon.ENV = ENV
  # end

  check_authorization

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to Rails.root + '401.html', alert: exception.message
  end
end
