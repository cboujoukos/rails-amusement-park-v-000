class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(name: params[:user][:name])
    if user&.authenticate(params[:user][:password])
      log_in user
      redirect_to user_path(user)
    else
      flash.now[:error] = "Invalid name/password combination"
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_path
  end
end
