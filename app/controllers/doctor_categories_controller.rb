class DoctorCategoriesController < ApplicationController
  before_action :set_doctor_category, only: [:show, :edit, :update, :destroy]
  before_action :set_doctors, only: [:show]
  layout :resolve_layout, only: [:show] 
  include EntityHelper


  def index
    @doctor_categories = DoctorCategory.all
  end

  def show
    if @doctors and !params[:state].blank? and !params[:city].blank?
      @doctors = @doctors.where(state:params[:state],city:params[:city])
    end
  end

  def new
  	@doctor_category = DoctorCategory.new
  end

  def edit
  end

  def create
    create_entity(DoctorCategory, doctor_category_params)
  end

  def update
    update_entity(@doctor_category, doctor_category_params)
  end

  def destroy
    destroy_entity(@doctor_category)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_doctor_category
      @doctor_category = DoctorCategory.find(params[:id])
    end

    def set_doctors
       @doctors =  @doctor_category.doctors.active
    end

    def resolve_layout
      "application"
      #"doctor_category" 
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def doctor_category_params
      params.require(:doctor_category).permit(:name, :avatar)
    end
    
end


