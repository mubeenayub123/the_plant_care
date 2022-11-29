# frozen_string_literal: true

class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, with: :show_not_found_errors
  before_action :authenticate_user!

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def show_not_found_errors(exception)
    render json: {error: exception.message}, status: :not_found
  end

  def configure_permitted_parameters
     devise_parameter_sanitizer.permit(:sign_up, keys: [:firstname, :lastname, :country_code, :line1, :line2, :postcode, :city, :phone_number, :province, :email, :password, :gender])
     devise_parameter_sanitizer.permit(:account_update, keys: [:firstname, :lastname, :country_code, :line1, :line2, :postcode, :city, :phone_number, :province, :email, :password, :current_password, :gender])
  end

  def after_sign_in_path_for(resource)
    current_user.admin? ? rails_admin_path : root_path
  end
end
