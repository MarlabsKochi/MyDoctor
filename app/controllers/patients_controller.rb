class PatientsController < ApplicationController
  before_action :set_patient, only: [:show, :edit, :update, :destroy]
  include EntityHelper

  def index
    @patients = Patient.all
  end

  def show
  end

  def new
    @patient = Patient.new
  end

  def edit
  end

  def update
    update_entity(@patient, patient_params)
  end

  def create
    create_entity(Patient, patient_params)
  end

  def destroy
    destroy_entity(@patient)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_patient
      @patient = Patient.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def patient_params
      params.require(:patient).permit(:name, :email, :age, :sex, :phone_number, :address, :avatar)
    end

end
