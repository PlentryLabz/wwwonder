class Api::V1::UploadsController < Api::V1::ApplicationController

  def create
    @user = current_user
    @user.update_attribute(:pic, params[:pic])
    render json: {success: 'OK'}, status: 200
  end

end