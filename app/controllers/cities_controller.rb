class CitiesController < ApplicationController
  respond_to :json

  def index
    if params[:country_id]
      country = Country.find_by_id(params[:country_id])
      @cities = country.cities
    else
      @cities = City.all
    end
    render json: @cities.collect {|v| {id: v.id, name: v.name}}
  end
end