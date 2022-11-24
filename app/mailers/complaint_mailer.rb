class ComplaintMailer < ApplicationMailer
  def new_complaint_email
    @complaint = params[:complaint]
    @user = @complaint.user
    mail(to: @user.email, subject: "Complaint Recieved")
  end

  def close_complaint_email
    @complaint = params[:complaint]
    @user = @complaint.user
    mail(to: @user.email, subject: "Complaint Closed")
  end
end
