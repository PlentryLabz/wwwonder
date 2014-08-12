class Api::V1::UsersController < Api::V1::ApplicationController

  def index
    search = User.search(params[:q])
    filter = case params[:sort]
      when 'by_name' then
        search.result.order(:second_name)
      when 'newest' then
        search.result.order(:created_at)
      when 'popular' then
        search.result.includes(:images).order("image.likes_count desc")
      else search.result
    end
    @users = filter.page(params[:page]).per(20)
  end

  def show
    @user = User.find(params[:id])
    respond_with(@user, location: nil)
  end

end