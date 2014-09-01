class Api::V1::UploadsController < Api::V1::ApplicationController

  def create
    @user = current_user
    if @user.update_attribute(:pic, params[:pic])
      render json: {success: 'OK'}, status: 200
    else
      render json: {errors: @user.errors}, status: 422
    end
  end

end