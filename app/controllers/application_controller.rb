class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate

  # Redirect to login page?
  private

  def authenticate
    redirect_to new_session_path unless authenticated?
  end

  def authenticated?
      return true if session[:flybuys_number]
  end

  def current_play
    session[:current_play]
  end
end
