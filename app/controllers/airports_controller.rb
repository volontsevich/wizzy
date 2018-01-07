class AirportsController < ApplicationController
  respond_to :json

  def index
    if params[:city_id]
      city = City.find_by_id(params[:city_id])
      @airports = city.airports
    else
      @airports = Airport.all
    end
    render json: @airports.collect {|v| {id: v.id, name: v.short_name}}
  end
end