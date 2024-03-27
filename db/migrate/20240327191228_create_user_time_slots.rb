class CreateUserTimeSlots < ActiveRecord::Migration[7.1]
  def change
    create_table :user_time_slots do |t|
      t.belongs_to :user,            null:false,   foreign_key: true
      t.bigint :teacher_id,          null: false
      t.integer :weekdays,           null:false
      t.time :start_work_time,       null:false
      t.time :end_work_time,         null:false

      t.timestamps
    end
  end
end
