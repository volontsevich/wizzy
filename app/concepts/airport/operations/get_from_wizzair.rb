class Airport < ActiveRecord::Base
  class GetFromWizzair < ::Trailblazer::Operation

    initialize_pipetree!
    step :form_report

    def form_report(options)
      raw_json = `curl "https://be.wizzair.com/7.7.2/Api/asset/map?languageCode=en-gb"`
      parsed_json = JSON.parse(raw_json)
      if parsed_json["cities"].present?
        airport_directions = []
        parsed_json["cities"].each do |city_json|
          #"countryCode", "connections", "aliases", "isExcludedFromGeoLocation", "rank",
          #"categories"]
          currency_code = city_json["currencyCode"]
          currency = Currency.find_or_create_by(name: currency_code)

          country_name = city_json["countryName"]
          country = Country.find_or_create_by(currency: currency, name: country_name)

          city_name = city_json["shortName"]
          city = City.find_or_create_by(country: country, name: city_name)

          airport_short_name = city_json["iata"]
          airport_longitude = city_json["longitude"]
          airport_latitude = city_json["latitude"]
          airport = Airport.find_or_create_by(city: city,
                                              short_name: airport_short_name,
                                              longitude: airport_longitude,
                                              latitude: airport_latitude,
                                              company_name: 'Wizz Air')
          connections = city_json["connections"]
          airport_directions.push([airport, connections.pluck("iata")])
        end

        airport_directions.each do |airport, directions|
          directions.each do |direction|
            connected_airport = Airport.find_by_short_name(direction)
            DirectConnection.find_or_create_by(airport_id: airport.id,
                                               connected_airport_id: connected_airport.id) if connected_airport.present?
          end
        end
      end
      options['data'] = 10
    end

  end
end