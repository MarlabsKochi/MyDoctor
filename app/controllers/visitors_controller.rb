class VisitorsController < ApplicationController
	before_action :get_cities, only: [:edit, :cities]

	def index
		if doctor_signed_in?
			@doctor = Doctor.find(current_doctor.id)
		end
	end

	def edit
	end

    def cities
    render json: @cities.to_json
    end
    
    def get_cities
      state = params[:state]  ? params[:state] : @doctor.state
      @cities = CS.cities(state, :in) if state
    end
end
