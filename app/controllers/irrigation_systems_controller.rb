# frozen_string_literal: true

class IrrigationSystemsController < ApplicationController
  before_action :set_irrigation_system, only: %i[show edit update destroy]

  # GET /irrigation_systems or /irrigation_systems.json
  def index
    @irrigation_systems = current_user.irrigation_systems
  end

  # GET /irrigation_systems/1 or /irrigation_systems/1.json
  def show; end

  # GET /irrigation_systems/new
  def new
    @irrigation_system = IrrigationSystem.new
  end

  # GET /irrigation_systems/1/edit
  def edit; end

  # POST /irrigation_systems or /irrigation_systems.json
  def create
    @irrigation_system = IrrigationSystem.find_by(irrigation_system_params)
    @irrigation_system.user = current_user if @irrigation_system.user.blank?

    respond_to do |format|
      if @irrigation_system.save && create_irrigation_system_plant
        format.html do
          redirect_to irrigation_systems_path, notice: 'Irrigation system was successfully created.'
        end
        format.json { render :index, status: :created, location: @irrigation_system }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @irrigation_system.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /irrigation_systems/1 or /irrigation_systems/1.json
  def update
    respond_to do |format|
      if @irrigation_system.update(irrigation_system_params) && update_irrigation_system_plant
        format.html do
          redirect_to irrigation_systems_path, notice: 'Irrigation system was successfully updated.'
        end
        format.json { render :index, status: :ok, location: @irrigation_system }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @irrigation_system.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /irrigation_systems/1 or /irrigation_systems/1.json
  def destroy
    @irrigation_system.irrigation_system_plants.destroy_all
    current_user.irrigation_systems.delete(@irrigation_system.id)
    puts @irrigation_system.errors.full_messages

    respond_to do |format|
      format.html { redirect_to irrigation_systems_url, notice: 'Irrigation system was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_irrigation_system
    @irrigation_system = IrrigationSystem.find(params[:id])
  end

  def create_irrigation_system_plant
    IrrigationSystemPlant.create(irrigation_system_id: @irrigation_system.id,
                                 plant_id: params[:irrigation_system][:plant_id_sensor_1], sensor_no: 1)
    IrrigationSystemPlant.create(irrigation_system_id: @irrigation_system.id,
                                 plant_id: params[:irrigation_system][:plant_id_sensor_2], sensor_no: 2)
  end

  def update_irrigation_system_plant
    @irrigation_system.irrigation_system_plants.where(sensor_no: 1).first&.update(plant_id: params[:irrigation_system][:plant_id_sensor_1])
    @irrigation_system.irrigation_system_plants.where(sensor_no: 2).first&.update(plant_id: params[:irrigation_system][:plant_id_sensor_2])
  end

  # Only allow a list of trusted parameters through.
  def irrigation_system_params
    params.require(:irrigation_system).permit(:uuid)
  end
end
