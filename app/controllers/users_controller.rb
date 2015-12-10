class UsersController < ApplicationController

  def index #used by site admin to get list of all registered users
    @users = User.all
    render "index.json.jbuilder", status: :ok
  end

  #def event_index
  #  @user = User.find(id: current_user.id)
  #  @user.events.all
  #end

  def groups
    binding.pry
		@groups = current_user.groups.order("name")
    #@membership = Member.where(user_id: current_user.id)
    #@groups = @membership.group_id
		render "groups.json.jbuilder", status: :ok

   end

  def user_info
    @user = User.where(id: params[:id])
    @groups = current_user.groups.order("name")
    render "user.json.jbuilder" , status: :ok

  end
end

