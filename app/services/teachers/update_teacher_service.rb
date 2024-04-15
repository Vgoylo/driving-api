module Teachers
  class UpdateTeacherService < BaseService
    attr_accessor :params, :teacher

    def initialize(teacher, params)
      @teacher = teacher
      @params = params
    end

    def call
      teacher.update(teacher_params)
      UpdateTeacherProfileService.call(params)
      teacher
    end

    private

    def teacher_params
      params.require(:teacher).permit(:id, :first_name, :last_name, :middle_name,
        :email, :phone_number, :date_of_birthday, teacher_profile_attributes: {})
    end
  end
end