class UsersController < ApplicationController

  def index #used by site admin to get list of all registered users
    @users = User.all
    render "index.json.jbuilder", status: :ok
  end

  def groups #user to retrieve all of a users groups
		@groups = current_user.groups.order("name")
		render "groups.json.jbuilder", status: :ok

   end

  def user_info #used to retrieve a users info plus all of their groups
    begin
      @user = User.where(id: params[:id])
      @groups = current_user.groups.order("name")
      render "user.json.jbuilder" , status: :ok  
    rescue => e
      Rails.logger.error { "#{e.message} #{e.backtrace.join("\n")}" }
    end
  end
end

