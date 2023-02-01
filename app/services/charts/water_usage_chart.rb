class Charts::WaterUsageChart
  attr_reader :irrigation_system
  def initialize(irrigation_system:)
    @irrigation_system = irrigation_system
  end

  def generate
    Fusioncharts::Chart.new(
      {
        width: '1070',
        height: '300',
        type: 'column2d',
        renderAt: 'waterUsageChartContainer',
        dataSource: {
          :"chart" => {
            :"caption" => 'Water Consumption By Irrigation System',
            :"subcaption" => 'All Plants',
            :"xaxisname" => 'Time Interval',
            :"yaxisname" => 'Water Usage (Liters)',
            :"numbersuffix" => 'L',
            :"theme" => 'gammel',
            "bgColor": "EEEEEE,CCCCCC",
            "bgratio": "60,40",
            "bgAlpha": "70,80",
            "bgAngle": "90"
          },
          :"data" => [
            { :"label" => 'One Month', :"value" => one_month_water_usage },
            { :"label" => 'One Week', :"value" => one_week_water_usage },
            { :"label" => 'One Day', :"value" => one_day_water_usage }
          ]
        }
      }
    )
  end


  def one_day_water_usage
    (irrigation_system.plant_data.where(created_at: 1.day.ago..).sum do |plant_datum|
      plant_datum.soil_moisture_data.sum(:water_pump)
    end * 15)/1000
  end

  def one_week_water_usage
    (irrigation_system.plant_data.where(created_at: 1.week.ago..).sum do |plant_datum|
      plant_datum.soil_moisture_data.sum(:water_pump)
    end * 15)/1000
  end

  def one_month_water_usage
    (irrigation_system.plant_data.where(created_at: 1.month.ago..).sum do |plant_datum|
      plant_datum.soil_moisture_data.sum(:water_pump)
    end * 15)/1000
  end

end
