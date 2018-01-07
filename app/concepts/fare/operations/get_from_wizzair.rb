class Fare < ActiveRecord::Base
  class GetFromWizzair < ::Trailblazer::Operation
    extend Contract::DSL

    contract do
      property :dep_station, virtual: true
      property :arr_station, virtual: true
      property :flight_date, virtual: true
      validates :dep_station, presence: true
      validates :arr_station, presence: true
      validates :flight_date, presence: true
    end

    initialize_pipetree!
    step Contract::Build()
    step Contract::Validate()
    step :get_data

    def get_data(options, params:, **)
      dep_station = params[:dep_station]
      arr_station = params[:arr_station]
      flight_date = params[:flight_date]
      command = "curl -X POST -H 'Content-Type: application/json' -H 'Accept: application/json, text/plain, */*' -d '{\"flightList\":[{\"departureStation\": \"#{dep_station}\",\"arrivalStation\": \"#{arr_station}\",\"date\": \"#{flight_date}\"}],\"adultCount\": 1,\"childCount\": 0,\"wdc\": false,\"dayInterval\": 10}'"
      raw_json = `#{command} https://be.wizzair.com/7.7.2/Api/asset/farechart`
      parsed_json = JSON.parse(raw_json)
      options['data'] = {}
      options['data']['outbound_flights'] = parsed_json["outboundFlights"]
      options['data']['return_flights'] = parsed_json["returnFlights"]
    end
  end
end