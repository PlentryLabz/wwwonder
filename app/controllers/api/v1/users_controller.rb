class Api::V1::UsersController < Api::V1::ApplicationController

  def index
    @users = User.all
    respond_with(@users, location: nil)
  end

  def show
    @user = User.find(params[:id])
    respond_with(@user, location: nil)
  end

  def create
    @user = User.new(params[:user])

    if @user.save
      respond_with(@user, location: nil)
    else
      render json: {errors: @user.errors.full_messages}, status: 422
    end
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(params[:user])
      respond_with(@user, location: nil)
    else
      render json: {errors: @user.errors.full_messages}, status: 422
    end
  end

end
