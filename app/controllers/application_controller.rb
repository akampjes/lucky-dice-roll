class ApplicationController < ActionController::Base
  helper_method :current_play

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
    Play.where(flybuys_number: session[:flybuys_number]).order(created_at: :desc).first
  end
end
