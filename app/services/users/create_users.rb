module Users
  class CreateUsers < BaseService
    attr_reader :params

    def initialize(params)
      @params = params
    end

    def call
      @user = User.new(params)
      @user.skip_password_validation = true
      @user.save!

      @user

    rescue ActiveRecord::RecordInvalid => e
      raise e.message
    end
  end
end
