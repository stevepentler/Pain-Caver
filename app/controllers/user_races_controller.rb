class UserRacesController < ApplicationController
  
  def new
    @user_race = UserRace.new
  end

  def create
    @user_race = UserRace.new(user_race_params)
    @user_race.user_id = current_user.id
    
    @user_race.save
    redirect_to dashboard_path
  end

  def edit
    @user_race = UserRace.find(params[:id])
  end

  def update
    @user_race = UserRace.find(params[:id])
    @user_race.update(user_race_params)
    redirect_to dashboard_path
  end

  def destroy
    @user_race = UserRace.find(params[:id])
    @user_race.delete
    redirect_to dashboard_path
  end

  private

  def user_race_params
    params.require(:user_race).permit(:date, :title, :distance, :target_time, :location, :start_time)
  end
end