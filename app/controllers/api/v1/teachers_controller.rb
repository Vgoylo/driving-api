module Api
  module V1
    class TeachersController < ApplicationController
      skip_before_action :verify_authenticity_token

      before_action :find_teacher, only: %i[show ]

      def index
        @teachers = Teacher.includes(:teacher_time_slots)
        render json: @teachers
      end

      def create
        @teacher = Teachers::CreateTeachers.call(teacher_params)

        render json: { status: 'SUCCESS', message: 'teacher was created successfully!', data: @teacher }, status: :created
      rescue ActionDispatch::Http::Parameters::ParseError => e
        render json: { message: e.message }
      end

      def show
        render json: { teacher: @teacher }
      end

      private

      def teacher_params
        params.require(:teacher).permit(:first_name, :last_name, :middle_name,
                                        :email, :phone_number, :date_of_birthday, :role)
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
