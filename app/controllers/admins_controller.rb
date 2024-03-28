class AdminsController < ApplicationController
  def show_teacher
    @teacher = Admins::ShowTeachers.call

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @teacher }
    end
  end

  def show_user
    @users = Admins::ShowUsers.call

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @users }
    end
  end
end