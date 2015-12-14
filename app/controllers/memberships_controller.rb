class MembershipsController < ApplicationController
	

  	def add
  		@member = User.find_by(id: params[:user_id])
  		@group = Group.find_by(id: params[:group_id])
  		@member.groups << @group
		render "member.json.jbuilder", status: :ok
	end

	def remove
    	@member = current_user.members.find_by(user_id: params[:user_id],group_id: params[:group_id])
		@member.destroy
		render "killmember.json.jbuilder", status: :ok
	end

  def memberindex
    @members = Groups_Users.all
    render  "memberindex.json.jbuilder", status: :ok
  end
	
end
