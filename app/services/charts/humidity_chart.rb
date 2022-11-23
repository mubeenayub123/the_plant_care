class Charts::HumidityChart
  attr_reader :plant_data
  def initialize(plant_data:)
    @plant_data = plant_data
  end

  def generate
    Fusioncharts::Chart.new(
      {
        width: '400',
        height: '300',
        type: 'angulargauge',
        renderAt: 'humidityChartContainer',
        dataSource: {
          :"chart" => {
            :"caption" => "Humidity",
            :"lowerlimit" => '50',
            :"upperlimit" => '150',
            :"showvalue" => '1',
            :"numbersuffix" => '%',
            :"theme" => 'gammel',
            :"showtooltip" => '0'
          },
          :"colorrange" => {
            :"color" => [
              {
                :"minvalue" => '50', :"maxvalue" => '150', :"code" => '#F2726F'
              }
            ]
          },
          :"dials" => { :"dial" => [{ :"value" => plant_data&.humidity }] }
        }
      }
    )
  end
end
