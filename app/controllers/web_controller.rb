class WebController < ApplicationController

  layout :false

  def show
    render "web/#{params[:id]}"
  end

end
