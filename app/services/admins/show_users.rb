module Admins
  class ShowUsers < BaseService
    attr_accessor :user

    def initialize
      @users = user
    end

    def call
      @user = User.includes(:user_time_slots)
    rescue StandardError
      raise StandardError
    end
  end
end