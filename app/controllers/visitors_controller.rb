class VisitorsController < ApplicationController

	def index
		if doctor_signed_in?
			@doctor = Doctor.find(current_doctor.id)
			@time_slots = @doctor.time_slots
		end
	end

end
