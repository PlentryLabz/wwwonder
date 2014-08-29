class Api::V1::UploadsController < Api::V1::ApplicationController

  def create
    render json: params.to_json, status: 202
  end

end