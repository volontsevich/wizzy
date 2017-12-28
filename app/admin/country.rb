ActiveAdmin.register Country do
  permit_params :name, :timezone, :currency_id
  menu label: 'Countries', priority: 3


  filter :name, label: 'Name'
  filter :currency
  filter :timezone, label: 'Timezone'

  form do |f|
    f.semantic_errors
    f.inputs 'General' do
      input :name, as: :string, label: 'Name'
      input :currency
      input :timezone, label: 'Timezone'
    end

    f.actions
  end

  index do
    selectable_column
    column :name
    column :currency
    column 'Timezone' do |f|
      f.timezone
    end
    actions
  end


  show do
    panel 'General' do
      attributes_table_for country do
        row :name
        row :currency
        row 'Timezone' do |e|
          e.timezone
        end
      end
    end

    # active_admin_comments
  end

end
