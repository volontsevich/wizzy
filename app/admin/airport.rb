ActiveAdmin.register Airport do
  permit_params :short_name, :latitude, :longitude, :city_id
  menu label: 'Airports', priority: 2


  filter :short_name, label: 'Name'
  filter :city
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
    # active_admin_comments
  end

end
