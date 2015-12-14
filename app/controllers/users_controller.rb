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
      @user = User.find_by(id: current_user.id)
      @groups = current_user.groups.order("name")
      render "user_info.json.jbuilder" , status: :ok  
  end
end

