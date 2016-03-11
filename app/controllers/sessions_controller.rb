class SessionsController < ApplicationController

  def new
  end

  def create
    author = Author.find_by(email: params[:email])
    if author && author.authenticate(params[:password])
      session[:user_id] = author.id 
      redirect_to root_path, notice: "Login successful"
    else
      flash[:notice] = "You didn't remember your password"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to new_sessions_path, notice: 'Session was successfully destroyed.'
  end
end
