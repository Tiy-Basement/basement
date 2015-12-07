class UsersController < ApplicationController

  def index
    @users = User.all
    render "index.json.jbuilder", status: :ok
  end

  def event_index
    @user = User.find(id: current_user.id)
    @user.events.all
  end

end