class SessionsController < ApplicationController
  
  def new
    if logged_in?
      redirect_to root_path
    end
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    
    respond_to do |format|
      if user && user.authenticate(params[:session][:password])
        session[:user_id] = user.id
        flash[:success] = "You have successfully logged in"
        format.html { redirect_to root_path }
        format.json { render json: session, status: :created, location: session }
      else
        flash[:danger] = "Incorrect email or password"
        format.html { render :new }
        format.json { render json: session.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def destroy
    session[:user_id] = nil
    flash[:success] = "You have logged out"
    redirect_to root_path
  end
  
end