class Charts::LightIntensityChart
  attr_reader :plant_data
  def initialize(plant_data:)
    @plant_data = plant_data
  end

  def generate
    Fusioncharts::Chart.new(
      {
        width: '400',
        height: '300',
        type: 'vled',
        renderAt: 'lightIntensityChartContainer',
        dataSource: {
          :"chart" => {
            :"caption" => 'Light Intensity',
            :"subcaption" => '(lx)',
            :"upperlimit" => '7000',
            :"numbersuffix" => ' lx',
            :"showvalue" => '0',
            :"chartbottommargin" => '50',
            :"ledgap" => '1',
            :"theme" => 'fusion'
          },
          :"colorrange" => {
            :"color" => [
              {
                :"minvalue" => '0',
                :"maxvalue" => '3000',
                :"code" => '#80dfff'
              },
              {
                :"minvalue" => '3000',
                :"maxvalue" => '6000',
                :"code" => '#ff944d'
              },
              {
                :"minvalue" => '6000',
                :"maxvalue" => '7000',
                :"code" => '#ff3300'
              }
            ]
          },
          :"value" => plant_data.light_intensity
        }
      }
    )
  end
end
