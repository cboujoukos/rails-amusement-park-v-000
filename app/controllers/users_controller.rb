class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  def show
    @user = User.find_by(id: params[:id])
    authorize! :read, @user
  end

  def ride
    @user = current_user
    authorize! :update, @user
    ride = Ride.new(user_id: current_user.id, attraction_id: params[:attraction_id])
    flash[:notice] = ride.take_ride
    redirect_to user_path(current_user)
  end

  private


  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation, :height, :nausea, :happiness, :tickets, :admin)
  end
end
