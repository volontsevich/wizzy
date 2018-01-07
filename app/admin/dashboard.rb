ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc {I18n.t("active_admin.dashboard")}

  content title: proc {I18n.t("active_admin.dashboard")} do

    def someChart
      chartData = City.joins(:country).group('countries.name').count.map {|key, value| {num: value, country: key}}
      if chartData
        chart = AmCharts::Chart::Serial.new(chartData) do |c|
          c.dimensions = '800x400'
          c.categoryField = 'country'
          c.category_axis

          graphs.new(:num, :column) do |g|
            g.fillAlphas = 0.7
            g.connect = false
          end

          c.angle = 30
          c.depth3D = 15
        end
        amchart(chart, "some-container")
      end
    end

    columns do

      column do
        panel 'City by country' do
          someChart
        end
      end
    end

  end

  action_item 'Get data from WizzAir' do
    link_to('Get data from WizzAir', import_wizzair_admin_airports_path)
  end
end
