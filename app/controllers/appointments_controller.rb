class AppointmentsController < ApplicationController

  def time_selector
    @scheduler = []
    @appointment = Appointment.new
    day_number = get_day_number(get_day_type)
    time_slot = get_doctor_time_slot
    @appointment_available = check_appointment_available(time_slot,day_number)
    @scheduler = @appointment_available ? time_slot : "No Appointment available for this date"
    @booked_slots = get_booked_timings
  end

  def get_day_type
    params[:date].to_date.strftime("%A")
  end

  def get_day_number ts
    case ts
    when 'Sunday'
      1
    when 'Monday'
      2
    when 'Tuesday'
      3
    when 'Wednesday'
      4
    when 'Thursday'
      5
    when 'Friday'
      6
    when 'Saturday'
      7
    end
  end

  def get_doctor_time_slot
    Doctor.find(params[:doctor_id]).time_slots.first
  end

  def check_appointment_available(ts,dn)
    ts.week_days.include?("#{dn}")
  end

  def get_booked_timings
    booked_timings = Appointment.where(doctor_id:params[:doctor_id], date:params[:date].to_date)
    boo = []
    if booked_timings.present?
      booked_timings.each do |booked_timing|
        boo.push(booked_timing.time.strftime("%I:%M:%S"))
      end
    end
    boo.join(',')
  end

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
