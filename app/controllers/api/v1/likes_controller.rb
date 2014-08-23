class Api::V1::LikesController < Api::V1::ApplicationController
  before_filter :authenticate_user!

  def create
    @like = Like.new(user_id: current_user.id, image_id: params[:image_id])
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