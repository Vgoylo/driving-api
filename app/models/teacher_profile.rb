class TeacherProfile < ApplicationRecord
  belongs_to :teacher
  has_one_attached :avatar
  has_one_attached :driving_licence
end
