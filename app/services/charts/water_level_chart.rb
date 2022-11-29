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
                  :"upperlimit" => '1.5',
                  :"lowerlimitdisplay" => 'Empty',
                  :"upperlimitdisplay" => 'Full',
                  :"numbersuffix" => ' ltrs',
                  :"cylfillcolor" => '#5D62B5',
                  :"plottooltext" => 'Water : <b>20 ltrs</b>',
                  :"cylfillhoveralpha" => '85',
                  :"theme" => 'gammel'
                },
                :"value" => '.50'
              }
            }
          )
  end
end
