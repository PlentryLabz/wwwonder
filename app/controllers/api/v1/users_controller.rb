class Api::V1::UsersController < Api::V1::ApplicationController
  before_filter :authenticate_user!, only: [:update]

  def index
    search = User.search(params[:q])
    filter = case params[:sort]
      when 'by_name' then
        search.result.order(:second_name)
      when 'newest' then
        search.result.order(:created_at)
      when 'popular' then
        search.result.joins(:images).order('likes_count DESC')
      else search.result
    end
    @users = filter.page(params[:page]).per(20)
    respond_with(@users, location: nil)
  end

  def show
    @user = User.find(params[:id])
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