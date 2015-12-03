class UsersController < ApplicationController

  def index
    @users = Users.all
  end

  def event_index
    @user = User.find(id: current_user.id)
    @user.events.all
  end

end