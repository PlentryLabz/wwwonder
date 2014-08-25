class Api::V1::ImagesController < Api::V1::ApplicationController
  before_filter :authenticate_user!, only: [:create, :destroy]

  def index
    search = Image.search(params[:q])
    @images = search.result.page(params[:page]).per(20)
    respond_with(@images, location: nil)
  end

  def create
    @image = Like.new(params[:image])
    @image.user = current_user
    if @image.save
      respond_with(@image, location: nil)
    else
      render json: {errors: @image.errors}, status: 422
    end
  end

  def destroy
    @image = Image.find(params[:id])
    @image.destroy
    respond_with(@image, location: nil)
  end

end