class Api::V1::CitiesController < Api::V1::ApplicationController

  def index
    @cities = City.all
    respond_with(@cities, location: nil)
  end

end