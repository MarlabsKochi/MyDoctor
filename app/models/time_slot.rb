class TimeSlot < ActiveRecord::Base
	belongs_to :doctor
	validates :from, :to, :duration, :week_days, presence: true
	before_create :ensure_no_other_record
	WEEK_DAYS = {'1' => "Sun",
							 '2' => 'Mon', 
							 '3' => 'Tue',
							 '4' => "Wed",
							 '5' => 'Thu',
							 '6' => 'Fri', 
							 '7' => 'Sat'}

  def retrive_days
    ws = self.week_days
    ds = ""
    ws.each do |w|
      ds <<  WEEK_DAYS[w]
      ds << ":"
    end
    ds.chop!
  end

  def ensure_no_other_record
  	time_slot = TimeSlot.where(doctor_id: self.doctor_id)
  	              .where("time_slots.from = ? or time_slots.to = ?",  self.from, self.to)
  	time_slot.blank? ? true : false
  end
end
