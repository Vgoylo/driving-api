module Admins
  class ShowTeachers < BaseService
    def call
      Teacher.includes(:teacher_profile)
    rescue StandardError
      raise StandardError
    end
  end
end