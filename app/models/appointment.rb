class Appointment < ActiveRecord::Base
  
  # Associations
  belongs_to :patient
  belongs_to :doctor

  # Validations
  validates :doctor_id, :patient_id, :date, presence: true
  validates_uniqueness_of :time, scope: [:date, :doctor_id], message: "Slot is already booked, Choose Some other timings"
end
