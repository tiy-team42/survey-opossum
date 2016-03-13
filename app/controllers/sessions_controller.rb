class SessionsController < ApplicationController

  def new
  end

  def index
  end

  def show
  end

  def create
    author = Author.find_by(email: params[:email])
    if author && author.authenticate(params[:password])
      session[:user_id] = author.id
      redirect_to root_path, notice: "Login successful"
    else
      flash[:notice] = "Invalid username or email. Please try again."
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to sessions_path, notice: "You've successfully logged out!"
  end
end
