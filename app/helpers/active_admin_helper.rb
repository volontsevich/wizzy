module ActiveAdminHelper
  def airports_for_select
    Airport.joins(city: [:country]).order('countries.name, cities.name').map {|airport| ["#{airport.city.country.name} - #{airport.city.name} - #{airport.short_name}", airport.id]}
  end
end