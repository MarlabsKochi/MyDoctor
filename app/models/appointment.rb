class Appointment < ActiveRecord::Base
  
  # Associations
  belongs_to :Patient
  belongs_to :Doctor

  # Validations
  validates :doctor_id, :patient_id, :date, :time, presence: true
  validates_uniqueness_of :time, scope: [:date, :doctor_id], message: "Slot is already booked, Choose Some other timings"
end
