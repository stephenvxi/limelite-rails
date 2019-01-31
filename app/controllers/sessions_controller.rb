require 'securerandom'

class SessionsController < ApplicationController
  
  def new
    if logged_in?
      redirect_to root_path
    end
  end

  # POST /login
  # POST /login.json
  def create
    email = request.format.json? ? params[:email] : params[:session][:email]
    password = request.format.json? ? params[:password] : params[:session][:password]
    
    user = User.find_by(email: email.downcase)
    
    respond_to do |format|
      if user && user.authenticate(password)
        auth_token = AuthToken.new
        auth_token.uuid = SecureRandom.uuid
        auth_token.user_id = user.id
        auth_token.save
        session[:auth_token] = auth_token.uuid
        flash[:success] = "You have successfully logged in"
        format.html { redirect_to root_path }
        format.json { render :json => { :user => user, :auth_token => auth_token } }
      else
        flash[:danger] = "Incorrect email or password"
        format.html { render :new }
        format.json { render json: flash, status: :unauthorized }
      end
    end
   
  end
  
  def destroy
    uuid = request.format.json? ? params[:auth_token] : session[:auth_token]
    if uuid
      auth_token = AuthToken.find_by(uuid: uuid)
      auth_token.expired = true
      auth_token.save
    end
    session[:auth_token] = nil
    respond_to do |format|
      flash[:success] = "You have logged out"
      format.html { redirect_to root_path }
      format.json { render json: flash }
    end
  end
  
end