class Api::V1::ProfilesController < Api::V1::ApplicationController
  before_filter :authenticate_user!

  def show
    @user = current_user
    respond_with(@user, location: nil)
  end

  def update
    @user = current_user
    if @user.update_attributes(params[:user])
      respond_with(@user, location: nil)
    else
      render json: {errors: @user.errors}, status: 422
    end
  end

end