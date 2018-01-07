ActiveAdmin.register_page "Fare Report" do
  menu parent: 'Reports'

  content do
    @airports = Airport.order(:short_name).all
    @countries = Country.order(:name).all
    @cities = City.order(:name).all
    @report_name = 'fare_report'
    render template: 'admin/reports/report_layout', locals: {
        airports: @airports,
        report_name: @report_name,
        countries: @countries,
        cities: @cities
    }
  end

end