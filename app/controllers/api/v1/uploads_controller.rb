class Api::V1::UploadsController < Api::V1::ApplicationController

  def create
    @user = current_user
    if @user.update_attribute(:pic, params[:pic])
      respond_with(@user, location: nil)
    else
      render json: {errors: @user.errors}, status: 422
    end
  end

end