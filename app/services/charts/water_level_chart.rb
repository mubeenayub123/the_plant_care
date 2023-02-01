class Charts::WaterLevelChart
  attr_reader :plant_data
  def initialize(plant_data:)
    @plant_data = plant_data
  end

  def generate
    Fusioncharts::Chart.new(
            {
              width: '350',
              height: '250',
              type: 'cylinder',
              renderAt: 'waterLevelChartContainer',
              dataSource: {
                :"chart" => {
                  :"caption" => 'Water Level',
                  :"lowerlimit" => '0',
                  :"upperlimit" => '1',
                  :"lowerlimitdisplay" => 'Empty',
                  :"upperlimitdisplay" => 'Full',
                  :"numbersuffix" => ' ltrs',
                  :"cylfillcolor" => '#5D62B5',
                  :"plottooltext" => 'Water : <b>20 ltrs</b>',
                  :"cylfillhoveralpha" => '85',
                  :"theme" => 'zune',
                  "bgColor": "EEEEEE,CCCCCC",
                  "bgratio": "60,40",
                  "bgAlpha": "70,80",
                  "bgAngle": "90"
                },
                :"value" => "#{value}"
              }
            }
          )
  end

  def value
    return 0.5 if plant_data.water_level < 200

    1
  end
end
