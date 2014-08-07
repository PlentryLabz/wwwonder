class Api::V1::UsersController < Api::V1::ApplicationController

  def index
    @users = User.all
    respond_with(@users, location: nil)
  end

  def show
    @user = User.find(params[:id])
    respond_with(@user, location: nil)
  end

end
