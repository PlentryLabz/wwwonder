class Api::V1::UsersController < Api::V1::ApplicationController

  def index
    @search = User.search(params[:q])
    @users = @search.result.page(params[:page]).per(20)
  end

  def show
    @user = User.find(params[:id])
    respond_with(@user, location: nil)
  end

end
