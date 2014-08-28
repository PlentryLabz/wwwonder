class Api::V1::ProfilesController < Api::V1::ApplicationController
  before_filter :authenticate_user!
  before_filter :get_user

  def show
    respond_with(@user, location: nil)
  end

  def update
    if @user.update_attributes(params[:user])
      respond_with(@user, location: nil)
    else
      render json: {errors: @user.errors}, status: 422
    end
  end

  private

  def get_user
    @user = current_user
  end

end