class InfoController < ApplicationController

  skip_authorization_check

  def index
    if session[:return_to]
      redirect_to session[:return_to]
      session[:return_to] = nil
    else
      render :index
    end
  end

  def unauthorized
    session[:return_to] = request.referrer
    render :unauthorized
  end
end
