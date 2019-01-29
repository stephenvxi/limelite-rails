class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_action :authenticate_user!
  
  helper_method :current_user, :logged_in?, :logged_in_as_admin?
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  def logged_in?
    !!current_user
  end
  
  def logged_in_as_company_admin?
    logged_in? && current_user.is_company_admin?
  end
  
  def logged_in_as_admin?
    logged_in? && current_user.is_admin?
  end
  
  def require_user
    if !logged_in?
      flash[:warning] = "You must be logged in to perform that action"
      redirect_to login_path
    end
  end
  
  def require_admin
    if !logged_in_as_admin?
      flash[:warning] = "You need administrator permissions to perform that action"
      redirect_to root_path
    end
  end
  
  def require_company_admin
    if !logged_in_as_company_admin? 
      flash[:warning] = "You need to be company administrator to perform that action"
      redirect_to root_path
    end
  end
end
