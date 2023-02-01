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
            :"upperlimit" => '50',
            :"numbersuffix" => '°C',
            :"thmfillcolor" => '#008ee4',
            :"showgaugeborder" => '1',
            :"gaugebordercolor" => '#008ee4',
            :"gaugeborderthickness" => '2',
            :"plottooltext" => 'Temperature: <b>$datavalue</b> ',
            :"theme" => 'gammel',
            :"showvalue" => '1',
            "majorTMColor": "#666666",
            "majorTMAlpha": "100",
            "majorTMThickness": "2",
            "minorTMColor": "#666666",
            "minorTMAlpha": "50",
            "minorTMThickness": "2",
            "bgColor": "EEEEEE,CCCCCC",
            "bgratio": "60,40",
            "bgAlpha": "70,80",
            "bgAngle": "180"
          },
          :"value" => plant_data&.temprature
        }
      }
    )
  end
end
