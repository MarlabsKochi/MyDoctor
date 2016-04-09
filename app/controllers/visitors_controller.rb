class VisitorsController < ApplicationController
  def index
    if doctor_signed_in?
      @doctor = Doctor.find(current_doctor.id)
    end
  end
end
