class CreateTeacherTimeSlots < ActiveRecord::Migration[7.1]
   def change
        create_table :teacher_time_slots do |t|
          t.belongs_to :teacher,         null:false,   foreign_key: true
          t.integer :weekdays,           null:false
          t.time :start_work_time,       null:false
          t.time :end_work_time,         null:false

          t.timestamps
        end
      end
end
