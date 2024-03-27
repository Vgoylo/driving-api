class AdminsController < ApplicationController
  def index
    @users = User.all

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @users }
    end
  end
end