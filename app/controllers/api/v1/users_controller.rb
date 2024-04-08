module Api
  module V1
    class UsersController < ApplicationController
      include ActiveModel::Serialization

      skip_before_action :verify_authenticity_token

      before_action :find_user, only: %i[ show ]

      def index
        @users = User.includes(:user_time_slots)
        render json: @users, each_serializer: UserSerializer
      end

      def create
        @user = Users::CreateUsers.call(user_params)

        render json: { status: 'SUCCESS', message: 'user was created successfully!', data: @user }, status: :created
      rescue ActionDispatch::Http::Parameters::ParseError, RuntimeError => e
        render json: { message: e.message }
      end

      def show
        render json: @user, serializer: UserSerializer
      end

      private

      def user_params
        params.require(:user).permit(:first_name, :last_name, :middle_name,
                                     :email, :phone_number, :role)
      end

      def find_user
        @user = User.find(params[:id])
      rescue ActiveRecord::RecordNotFound,
             ActionDispatch::Http::Parameters::ParseError => e
        render json: { message: e.message }
      end
    end
  end
end
