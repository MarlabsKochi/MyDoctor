class DoctorsController < ApplicationController
  before_action :set_doctor, only: [:show, :edit, :update, :destroy]
  before_action :get_cities, only: [:edit, :cities]
  before_action :set_time_slots, only: [:show]
  include EntityHelper
  def index
    @doctors = Doctor.all
  end

  def show
  end

  def new
    @doctor = Doctor.new
  end

  def edit
    @doctor.documents.build 
  end
  
  def cities
    render json: @cities.to_json
  end

  def update
    update_entity(@doctor, doctor_params)
  end

  def create
    create_entity(Doctor, doctor_params)
  end

  def destroy
    destroy_entity(@doctor)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_doctor
      @doctor = Doctor.find(params[:id])
    end

    def set_time_slots
      @time_slots = @doctor.time_slots
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def doctor_params
      params.require(:doctor).permit(:name, :email, :age, :phone_number, :experience, :about_me, :hospital_name, :hospital_address, :hospital_phone, :hospital_landmark, :state, :city, :avatar, documents_attributes: [:doctor_id, :avatar])
    end

    def get_cities
      state = params[:state]  ? params[:state] : @doctor.state
      @cities = state ? CS.cities(state, :in) : []
    end

end
