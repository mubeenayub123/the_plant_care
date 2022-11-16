# frozen_string_literal: true

json.extract! plant, :id, :name, :required_soil_moisture, :created_at, :updated_at
json.url plant_url(plant, format: :json)
