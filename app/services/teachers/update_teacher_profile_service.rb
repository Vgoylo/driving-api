# frozen_string_literal: true
module Teachers
  class UpdateTeacherProfileService < BaseService
    attr_accessor :params

    def initialize(params)
      @params = params
    end

    def call
      teacher_profile = TeacherProfile.find_by(teacher_id: params[:id])
      teacher_profile.update!(params_teacher_profile)
      teacher_profile
    end

    private

    def params_teacher_profile
      params['teacher_profile_attributes'].permit(:unp, :price)
    end
  end
end
