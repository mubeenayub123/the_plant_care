class MachineLearning::Prediction
  PREDITCION_ENDPOINT = 'https://plant-preditcion.herokuapp.com/predict'
  attr_reader :moisture_data
  delegate :plant_datum, :value, to: :moisture_data
  delegate :humidity, :temprature, :light_intensity, to: :plant_datum
  def initialize(moisture_data:)
    @moisture_data = moisture_data
  end

  def predict
    response = HTTParty.post(PREDITCION_ENDPOINT, body: request_body, headers: request_headers)
    response&.[]('prediction')&.first&.first
  end

  def request_body
    {
      light_intensity: light_intensity,
      temprature: temprature,
      humidity: humidity,
      soil_moisture: value
    }.to_json
  end

  def request_headers
    { 'Content-Type' => 'application/json' }
  end

end
