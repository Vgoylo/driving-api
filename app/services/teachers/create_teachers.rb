module Teachers
  class CreateTeachers < BaseService
    attr_reader :params

    def initialize(params)
      @params = params
    end

    def call
      @teacher = Teacher.new(params)
      @teacher.skip_password_validation = true
      @teacher.save!

    rescue ActiveRecord::RecordInvalid => e
      raise e.message
    end
  end
end
