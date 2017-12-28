ActiveAdmin.register City do
  permit_params :name, :rent_per_day, :country_id
  menu label: 'Cities', priority: 2


  filter :name, label: 'Name'
  filter :country
  filter :rent_per_day, label: 'Rent per day'

  form do |f|
    f.semantic_errors
    f.inputs 'General' do
      input :name, as: :string, label: 'Name'
      input :country
      input :rent_per_day, label: 'Rent per day'
    end

    f.actions
  end

  index do
    selectable_column
    column :name
    column :country
    column 'Rent per day' do |f|
      f.rent_per_day
    end
    actions
  end


  show do
    panel 'General' do
      attributes_table_for city do
        row :name
        row :country
        row 'Rent per day' do |e|
          e.rent_per_day
        end
      end
    end

    # active_admin_comments
  end

end
