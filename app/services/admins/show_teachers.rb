module Admins
  class ShowTeachers < BaseService
    attr_accessor :teacher

    def initialize()
      @teacher = teacher
    end

    def call
      @teacher = Teacher.includes(:teacher_time_slots)
    rescue StandardError
      raise StandardError
    end
  end
end