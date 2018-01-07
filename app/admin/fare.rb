ActiveAdmin.register Fare do
  menu label: 'Fares', priority: 6

  action_item 'Back' do
    link_to('Back', :back)
  end


  collection_action :get_by_direction do
    @dep_airports = Airport.where(city_id: params[:city_dep_id])
    @arr_airports = Airport.where(city_id: params[:city_arr_id])
    result = Fare::GetFromWizzair.(dep_station: @dep_airports.first.short_name,
        arr_station: @arr_airports.first.short_name,
        flight_date: '2018-03-13')
    @data = result['data']
  end
end

