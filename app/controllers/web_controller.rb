class WebController < ApplicationController

  before_filter :authenticate_user!
  layout :false

  def show
    render "web/#{params[:id]}"
  end

end
