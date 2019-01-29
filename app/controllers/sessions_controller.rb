class SessionsController < ApplicationController
  
  def new
    if logged_in?
      redirect_to root_path
    end
  end

  # POST /login
  # POST /login.json
  def create
    user_id = request.format.json? ? params[:email] : params[:session][:user_id]
    password = request.format.json? ? params[:password] : params[:session][:password]
    
    user = User.find_by(email: user_id.downcase)
    
    respond_to do |format|
      if user && user.authenticate(password)
        session[:user_id] = user.id
        flash[:success] = "You have successfully logged in"
        format.html { redirect_to root_path }
        format.json { render json: user }
      else
        flash[:danger] = "Incorrect email or password"
        format.html { render :new }
        format.json { render json: "Incorrect email or password" }
      end
    end
   
  end
  
  def destroy
    session[:user_id] = nil
    flash[:success] = "You have logged out"
    redirect_to root_path
  end
  
end