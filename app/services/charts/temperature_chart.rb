class Charts::TemperatureChart
  attr_reader :plant_data
  def initialize(plant_data:)
    @plant_data = plant_data
  end

  def generate
    Fusioncharts::Chart.new(
      {
        width: '350',
        height: '250',
        type: 'thermometer',
        renderAt: 'shartContainer',
        dataSource: {
          :"chart" => {
            :"caption" => 'Temperature',
            :"lowerlimit" => '0',
            :"upperlimit" => '60',
            :"numbersuffix" => '°C',
            :"thmfillcolor" => '#008ee4',
            :"showgaugeborder" => '1',
            :"gaugebordercolor" => '#008ee4',
            :"gaugeborderthickness" => '2',
            :"plottooltext" => 'Temperature: <b>$datavalue</b> ',
            :"theme" => 'fusion',
            :"showvalue" => '1'
          },
          :"value" => plant_data&.temprature
        }
      }
    )
  end
end
