class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session
  
  helper_method :current_user, :logged_in?, :logged_in_as_admin?
  
  def current_user
    uuid = request.format.json? ? params[:auth_token] : session[:auth_token]
    if uuid
      auth_token = AuthToken.find_by(uuid: uuid)
    end
    @current_user ||= auth_token.user if auth_token && !auth_token.expired?
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
      respond_to do |format|
        format.html { redirect_to login_path }
        format.json { render json: flash, status: :unauthorized }
      end
    end
  end
  
  def require_company_admin
    if !logged_in_as_company_admin? 
      flash[:warning] = "You need to be company administrator to perform that action"
      respond_to do |format|
        format.html { redirect_to root_path }
        format.json { render json: flash, status: :unauthorized }
      end
    end
  end
  
  def require_admin
    if !logged_in_as_admin?
      flash[:warning] = "You need administrator permissions to perform that action"
      respond_to do |format|
        format.html { redirect_to root_path }
        format.json { render json: flash, status: :unauthorized }
      end
    end
  end
end
