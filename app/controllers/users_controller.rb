class UsersController < ApplicationController

  def index
    @users = User.all
    render "index.json.jbuilder", status: :ok
  end

  def event_index
    @user = User.find(id: current_user.id)
    @user.events.all
  end

  def groups
		@groups = current_user.groups.order("name")
		render "groups.json.jbuilder", status: :ok

   end

end

#can we have 2 routes that go to the same method with optional params?