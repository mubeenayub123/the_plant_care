# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
     devise_parameter_sanitizer.permit(:sign_up, keys: [:firstname, :lastname, :country_code, :line1, :line2, :postcode, :city, :phone_number, :province, :email, :password, :gender])
     devise_parameter_sanitizer.permit(:account_update, keys: [:firstname, :lastname, :country_code, :line1, :line2, :postcode, :city, :phone_number, :province, :email, :password, :current_password, :gender])
  end
end
