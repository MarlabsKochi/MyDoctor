class TimeSlotsController < ApplicationController
  before_action :set_time_slot, only: [:destroy]
  before_action :set_time_slots, only: [:destroy]


  def create
    begin 
      @time_slot = TimeSlot.new(time_slot_params)
      @time_slot.week_days = params[:week_days] 
      @message = "Please check the details" if !@time_slot.save
    rescue StandardError => e
      logger.error e.message
    end
    set_time_slots
  	render partial: "time_slots"
  end

  def destroy
    @time_slot.destroy
    render partial: "time_slots"
  end

  private

    def set_time_slot
      @time_slot = TimeSlot.find(params[:id])
    end

    def set_time_slots
      @time_slots = @time_slot.doctor.time_slots
    end

    def time_slot_params
      params.require(:time_slot).permit(:from, :to, :duration,  :doctor_id)
    end

end
