module ApplicationHelper
  def authenticated?
    return true if session[:flybuys_number]
  end

  def flybuys_number
    session[:flybuys_number]
  end
end
