class Charts::MoistureChart
  attr_reader :moisture_data
  delegate :sensor_no, to: :moisture_data
  def initialize(moisture_data:)
    @moisture_data = moisture_data
  end

  def generate
    Fusioncharts::Chart.new(
       {
         width: '350',
         height: '250',
         type: 'angulargauge',
         renderAt: "moistureChartContainer#{sensor_no}",
         dataSource: {
           :"chart" => {
             :"caption" => 'Moisture',
             :"subcaption" => plant_name,
             :"captionontop" => '0',
             :"origw" => '380',
             :"origh" => '250',
             :"gaugestartangle" => '135',
             :"gaugeendangle" => '45',
             :"gaugeoriginx" => '190',
             :"gaugeoriginy" => '220',
             :"gaugeouterradius" => '190',
             :"theme" => 'gammel',
             :"showvalue" => '1',
             :"numbersuffix" => ' %',
             :"valuefontsize" => '25',
             "bgColor": "EEEEEE,CCCCCC",
             "bgratio": "60,40",
             "bgAlpha": "70,80",
             "bgAngle": "90"
           },
           :"colorrange" => {
             :"color" => [
               {
                 :"minvalue" => '0', :"maxvalue" => '20', :"code" => '#C9F6FF'
               },
               {
                 :"minvalue" => '20', :"maxvalue" => '40', :"code" => '#97EBF4'
               },
               {
                 :"minvalue" => '40', :"maxvalue" => '60', :"code" => '#7AE5F5'
               },
               {
                 :"minvalue" => '60', :"maxvalue" => '80', :"code" => '#65DDEF'
               },
               {
                 :"minvalue" => '80', :"maxvalue" => '100', :"code" => '#35D6ED'
               }
             ]
           },
           :"dials" => {
             :"dial" => [
               { :"value" => moisture_data.value, :"tooltext" => 'Moderate' }
             ]
           }
         }
       }
     )
  end

  def normal_moisture
    @moisture ||= (plant&.required_soil_moisture) || 50
  end

  def plant_name
    @plant_name ||= plant&.name
  end

  def plant
    @plant ||= moisture_data.plant_datum&.irrigation_system&.irrigation_system_plants&.where(sensor_no: sensor_no)&.first&.plant
  end
end
