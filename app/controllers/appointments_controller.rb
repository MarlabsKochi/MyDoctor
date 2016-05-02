class AppointmentsController < ApplicationController
  def index

  end

  def show
  end

  def new
    @appointment = Appointment.new
  end

  def create
    @appointment= Appointment.new(appointment_params)
    @appointment.patient_id = current_patient.id

    respond_to do |format|
     if @appointment.save
       format.html { redirect_to @appointment, notice: 'Appointment was successfully created'}
       format.json { render :show, status: :created, location: @appointment }
     else
       format.html { render :new }
       format.json { render json: @appointment.errors, status: :unprocessable_entity }
     end
    end
  end

  def edit
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def appointment_params
      params[:appointment].parse_time_select! :time
      params[:appointment][:date].to_date
      params[:appointment][:doctor_id] = params[:doctor_id]
      params.require(:appointment).permit(:date, :time, :doctor_id, :patient_id)
    end
end
