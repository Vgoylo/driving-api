module Users
  class UpdateUserService < BaseService
    attr_accessor :params, :user

    def initialize(user, params)
      @user = user
      @params = params
    end

    def call
      user.update(user_params)
      user
    end

    private

    def user_params
      params.require(:user).permit(:first_name, :last_name, :middle_name,
                                   :email, :phone_number)
    end
  end
end