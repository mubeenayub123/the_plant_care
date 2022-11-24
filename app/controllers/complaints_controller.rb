class ComplaintsController < ApplicationController
  before_action :set_complaint, only: %i[ show edit update destroy ]

  # GET /complaints or /complaints.json
  def index
    @complaints = current_user.complaints.all.reverse
  end

  # GET /complaints/1 or /complaints/1.json
  def show
  end

  # GET /complaints/new
  def new
    @complaint = Complaint.new
  end

  # GET /complaints/1/edit
  def edit
  end

  # POST /complaints or /complaints.json
  def create
    @complaint = Complaint.new(complaint_params)

    respond_to do |format|
      if @complaint.save
        ComplaintMailer.with(complaint: @complaint).new_complaint_email.deliver_later
        format.html { redirect_to complaints_path, notice: "Complaint was successfully created." }
        format.json { render :index, status: :created, location: @complaint }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @complaint.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /complaints/1 or /complaints/1.json
  def update
    respond_to do |format|
      if @complaint.update(complaint_params)
        format.html { redirect_to complaints_path, notice: "Complaint was successfully updated." }
        format.json { render :index, status: :ok, location: @complaint }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @complaint.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /complaints/1 or /complaints/1.json
  def destroy
    @complaint.closed!

    respond_to do |format|
      ComplaintMailer.with(complaint: @complaint).close_complaint_email.deliver_later
      format.html { redirect_to complaints_url, notice: "Complaint was successfully Closed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_complaint
      @complaint = Complaint.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def complaint_params
      params.require(:complaint).permit(:title, :description, :status, :user_id, :irrigation_system_id)
    end
end
