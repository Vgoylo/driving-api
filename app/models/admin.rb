class Admin < ApplicationRecord
  scope :teacher_time, ->() { Teacher.includes(:teacher_time_slots) }
  # Ex:- scope :active, lambda {where(:active => true)}
end
