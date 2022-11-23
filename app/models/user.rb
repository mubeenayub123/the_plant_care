# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :irrigation_systems


  def full_name
    firstname&.camelcase+' '+lastname&.camelcase
  end

  def countries
    ISO3166::Country.countries.map(&:name)
  end
end
