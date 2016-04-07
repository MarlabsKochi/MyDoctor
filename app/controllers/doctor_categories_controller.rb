class DoctorCategoriesController < ApplicationController
	before_action :set_doctor_category, only: [:show, :edit, :update, :destroy]


def index
	@doctor_categories = DoctorCategory.all
end

def show
  if !params[:state].blank? and !params[:city].blank?
  @doctors =  @doctor_category.doctors.active
                .where(state:params[:state],city:params[:city])

  else
  @doctors = @doctor_category.doctors.active 
end
end

def new
	@doctor_category = DoctorCategory.new
end
def edit
end

def create
	@doctor_category = DoctorCategory.new(doctor_category_params)

	respond_to do |format|
		if @doctor_category.save
			format.html { redirect_to @doctor_category, notice: 'doctor category uploaded'}
			format.json { render :show, status: :created, location: @doctor_category }
      else
        format.html { render :new }
        format.json { render json: @doctor_category.errors, status: :unprocessable_entity }
      end
    end
  end

def update
    respond_to do |format|
      if @doctor_category.update(doctor_category_params)
        format.html { redirect_to @doctor_category, notice: 'doctor category was successfully updated.' }
        format.json { render :show, status: :ok, location: @doctor_category }
      else
        format.html { render :edit }
        format.json { render json: @doctor_category.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @doctor_category.destroy
    respond_to do |format|
      format.html { redirect_to doctor_categories_url, notice: 'doctor category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_doctor_category
      @doctor_category = DoctorCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def doctor_category_params
      params.require(:doctor_category).permit(:name)
    end


end


