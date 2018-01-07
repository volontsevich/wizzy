class AddCompanyNameToAirports < ActiveRecord::Migration[5.0]
  def change
    add_column :airports, :company_name, :integer
  end
end
