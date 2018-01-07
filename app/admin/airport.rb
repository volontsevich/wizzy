ActiveAdmin.register Airport do
  permit_params :short_name, :latitude, :longitude, :city_id
  menu label: 'Airports', priority: 2


  filter :short_name, label: 'Name'
  filter :city, as: :select, collection: City.order(:name)
  filter :latitude
  filter :longitude

  form do |f|
    f.semantic_errors
    f.inputs 'General' do
      input :short_name, as: :string, label: 'Name'
      input :city
      input :latitude
      input :longitude
    end

    f.actions
  end

  index do
    selectable_column
    column :short_name
    column 'Country' do |e|
      e.city.country
    end
    column :city
    column :latitude
    column :longitude
    actions
  end


  show do
    panel 'General' do
      attributes_table_for airport do
        row :short_name
        row :city
        row :latitude
        row :longitude
      end

    end

    panel "Connected Airports" do
      table_for airport.direct_connections do
        column :airport do |instance|
          if instance.connected_airport.present?
            link_to("#{instance.connected_airport.short_name} (#{instance.connected_airport.city.name})",
                    admin_airport_path(instance.connected_airport_id))
          else
            'NOT FOUND'
          end
        end
      end
    end
    # active_admin_comments
  end

  collection_action :import_wizzair, method: :get do
    result = Airport::GetFromWizzair.()
    redirect_to admin_dashboard_path
  end

end
