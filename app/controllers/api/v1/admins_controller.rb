module Api
  module V1
    class AdminsController < ApplicationController
      def index
        @users = User.all
        render json: @users
      end
    end
  end
end