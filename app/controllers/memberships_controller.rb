class MembershipsController < ApplicationController
	

  	def add
  		@member = User.find_by(username: params[:username])
  		@group = Group.find_by(name: params[:name])
  		@member.groups << @group
		render "member.json.jbuilder", status: :created
	end

	def remove
    	@member = current_user.members.find_by(user_id: params[:user_id],group_id: params[:group_id])
		@member.destroy
		render "killmember.json.jbuilder", status: :removed_permenently
	end

	def memberindex
	    @members = Group.users.where(id: group.id)
	    render  "memberindex.json.jbuilder", status: :found
	end
		
end
