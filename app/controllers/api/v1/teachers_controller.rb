module Api
  module V1
    class TeachersController < ApplicationController
      include ActiveModel::Serialization

      skip_before_action :verify_authenticity_token

      before_action :find_teacher, only: %i[show ]

      def index
        @teachers = Teacher.includes(:teacher_profile)
        render json: @teachers, each_serializer: TeacherSerializer
      end

      def create
        @teacher = Teachers::CreateTeachers.call(teacher_params)

        render json: { status: 'SUCCESS', message: 'teacher was created successfully!', data: @teacher }, status: :created
      rescue ActionDispatch::Http::Parameters::ParseError, RuntimeError => e
        render json: { message: e.message }
      end

      def show
        render json: @teacher, serializer: TeacherSerializer
      end

      private

      def teacher_params
        params.require(:teacher).permit(:first_name, :last_name, :middle_name,
                                        :email, :phone_number, :date_of_birthday, :role, teacher_profile_attributes: {})
      end

      def find_teacher
        @teacher = Teacher.find(params[:id])
      rescue ActiveRecord::RecordNotFound,
             ActionDispatch::Http::Parameters::ParseError => e
        render json: { message: e.message }
      end
    end
  end
end
