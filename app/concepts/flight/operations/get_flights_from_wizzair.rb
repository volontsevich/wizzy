class Flight < ActiveRecord::Base
  class GetFromWizzair < ::Trailblazer::Operation
    extend Contract::DSL

    contract do
      property :dep_station, virtual: true
      property :arr_station, virtual: true
      property :dep_flight_date, virtual: true
      property :arr_flight_date, virtual: true
      validates :dep_station, presence: true
      validates :arr_station, presence: true
      validates :dep_flight_date, presence: true
      validates :arr_flight_date, presence: true
    end

    initialize_pipetree!
    step Contract::Build()
    step Contract::Validate()
    step :get_data

    def get_data(options, params:, **)
      dep_station = params[:dep_station]
      arr_station = params[:arr_station]
      dep_flight_date = params[:dep_flight_date]
      arr_flight_date = params[:arr_flight_date]
      raw_json = `curl "https://be.wizzair.com/#{Airport::GetFromWizzair::WIZZ_AIR_API_VERSION}/Api/search/flightDates?departureStation=#{dep_station}&arrivalStation=#{arr_station}&from=#{dep_flight_date}&to=#{arr_flight_date}"`
      parsed_json = JSON.parse(raw_json)
      options['data'] = parsed_json["flightDates"]
    end
  end
end