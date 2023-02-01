class Charts::HumidityChart
  attr_reader :plant_data
  def initialize(plant_data:)
    @plant_data = plant_data
  end

  def generate
    Fusioncharts::Chart.new(
      {
        width: '350',
        height: '250',
        type: 'angulargauge',
        renderAt: 'humidityChartContainer',
        dataSource: {
          :"chart" => {
            :"caption" => "Humidity",
            :"lowerlimit" => '0',
            :"upperlimit" => '100',
            :"showvalue" => '1',
            :"numbersuffix" => '%',
            :"theme" => 'gammel',
            :"showtooltip" => '0',
            "bgColor": "EEEEEE,CCCCCC",
            "bgratio": "60,40",
            "bgAlpha": "70,80",
            "bgAngle": "180"
          },
          :"colorrange" => {
            :"color" => [
              {
                :"minvalue" => '0', :"maxvalue" => '100', :"code" => '#0900ff'
              }
            ]
          },
          :"dials" => { :"dial" => [{ :"value" => plant_data&.humidity }] }
        }
      }
    )
  end
end
