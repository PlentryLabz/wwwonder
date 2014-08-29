class Api::V1::LikesController < Api::V1::ApplicationController
  before_filter :authenticate_user!, except: [:create_without_auth]

  def create
    phone = current_user.phone
    if phone.confirmed?
      @like = Like.new(phone_id: phone.id, image_id: params[:image_id])
      if @like.save
        respond_with(@like, location: nil)
      else
        render json: {errors: @like.errors}, status: 422
      end
    else
      render json: {error: 'Phone not confirmed'}, status: 409
    end
  end

  def create_without_auth
    phone = Phone.find_by_number(params[:number])
    if phone.confirmed?
      @like = Like.new(phone_id: phone.id, image_id: params[:image_id])
      if @like.save
        respond_with(@like, location: nil)
      else
        render json: {errors: @like.errors}, status: 422
      end
    else
      render json: {error: 'Phone not confirmed'}, status: 409
    end
  end

  def destroy
    @like = Like.find(params[:id])
    @like.destroy
    respond_with(@like, location: nil)
  end

end