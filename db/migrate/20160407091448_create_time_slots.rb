class CreateTimeSlots < ActiveRecord::Migration
  def change
    create_table :time_slots do |t|
      t.references :doctor, null: false
      t.string :from, null: false
      t.string :to, null: false
      t.string :duration
      t.text :week_days, array: true, default: []
      t.timestamps null: false
    end
  end
end
