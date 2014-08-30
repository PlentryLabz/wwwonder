class Api::V1::LikesController < Api::V1::ApplicationController
  before_filter :authenticate_user!
  before_filter :confirm_phone!

  def create
    phone = current_user.phone
    @like = Like.new(phone_id: phone.id, image_id: params[:image_id])
    if @like.save
      respond_with(@like, location: nil)
    else
      render json: {errors: @like.errors}, status: 422
    end
  end

  def destroy
    @like = Like.find(params[:id])
    @like.destroy
    respond_with(@like, location: nil)
  end

end