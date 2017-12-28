ActiveAdmin.register Currency do
  permit_params :name, :rate
  menu label: 'Currencies', priority: 4


  filter :name, label: 'Name'
  filter :rate, label: 'Euro Rate'

  form do |f|
    f.semantic_errors
    f.inputs 'General' do
      input :name, label: 'Name'
      input :rate, label: 'Euro Rate'
    end

    f.actions
  end

  index do
    selectable_column
    column :name
    column 'Euro Rate' do |f|
      f.rate
    end
    actions
  end


  show do
    panel 'General' do
      attributes_table_for currency do
        row :name
        row 'Euro Rate' do |e|
          e.rate
        end
      end
    end

    # active_admin_comments
  end

end
