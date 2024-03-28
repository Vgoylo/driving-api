module Admins
  class ShowUsers < BaseService
    def call
      User.includes(:user_time_slots)
    rescue StandardError
      raise StandardError
    end
  end
end