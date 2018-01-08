include ActiveAdminHelper
ActiveAdmin.register Fare do
  permit_params :dep_airport_id, :arr_airport_id, :amount
  menu label: 'Fares', priority: 6

  action_item 'Back' do
    link_to('Back', :back)
  end


  collection_action :get_by_direction do
    @dep_airports = Airport.where(city_id: params[:city_dep_id])
    @arr_airports = Airport.where(city_id: params[:city_arr_id])
    result = Fare::GetFromWizzair.(dep_station: @dep_airports.first.short_name,
        arr_station: @arr_airports.first.short_name,
        dep_flight_date: params[:dep_flight_date],
        arr_flight_date: params[:arr_flight_date]
    )
    @data = result['data']
  end

  filter :dep_airport, label: 'Departure Airport', collection: airports_for_select
  filter :arr_airport, label: 'Arrival Airport', collection: airports_for_select

  form do |f|
    f.semantic_errors
    f.inputs 'General' do
      input :dep_airport, label: 'Departure Airport', collection: airports_for_select
      input :arr_airport, label: 'Arrival Airport', collection: airports_for_select
      input :amount
    end

    f.actions
  end

  index do
    selectable_column
    column :dep_airport do |e|
      e.dep_airport.short_name
    end
    column :arr_airport do |e|
      e.arr_airport.short_name
    end
    column :amount
    actions
  end


  show do
    panel 'General' do
      attributes_table_for fare do
        row :dep_airport
        row :arr_airport
        row :amount
      end
    end

    # active_admin_comments
  end
end

