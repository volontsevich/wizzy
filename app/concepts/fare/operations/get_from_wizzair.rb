class Fare < ActiveRecord::Base
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
      dep_flight_date = Date.parse(params[:dep_flight_date])
      arr_flight_date = Date.parse(params[:arr_flight_date])
      interval = (arr_flight_date-dep_flight_date).to_i / 2
      middle_date = dep_flight_date + interval
      command = "curl -X POST -H 'Content-Type: application/json' -H 'Accept: application/json, text/plain, */*' -d '{\"flightList\":[{\"departureStation\": \"#{dep_station}\",\"arrivalStation\": \"#{arr_station}\",\"date\": \"#{middle_date.strftime('%Y-%d-%m')}\"}],\"adultCount\": 1,\"childCount\": 0,\"wdc\": false,\"dayInterval\": #{interval}}'"
      raw_json = `#{command} https://be.wizzair.com/#{Airport::GetFromWizzair::WIZZ_AIR_API_VERSION}/Api/asset/farechart`
      parsed_json = JSON.parse(raw_json)
      options['data'] = {}
      options['data']['outbound_flights'] = parsed_json["outboundFlights"]
      options['data']['return_flights'] = parsed_json["returnFlights"]
    end
  end
end