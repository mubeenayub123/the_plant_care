class PlantDatum < ApplicationRecord
  belongs_to :irrigation_system


  def self.csv
    CSV.generate do |csv|
      csv << PlantDatum.first.attributes.map { |a,v| a }
      all.each do |s|
        csv << s.attributes.map { |a,v| v }
      end
    end
  end
end
