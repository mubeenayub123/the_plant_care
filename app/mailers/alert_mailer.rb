class AlertMailer < ApplicationMailer
  def new_alert_email
    @plant_data = params[:plant_data]
    @user = @plant_data.irrigation_system.user
    mail(to: @user.email, subject: "Water Refil Needed")
  end
end
