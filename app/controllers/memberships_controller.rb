class MembershipsController < ApplicationController
	
#cary is sending us Access-Token, Group Name, Join Password
  	def add
  		#@member = User.find_by(username: params[:username])
      @member = current_user
  		@group = Group.find_by(name: params[:name])
  		@member.groups << @group
		render "member.json.jbuilder", status: :created
	end

	def remove
    	#@member = current_user.members.find_by(user_id: params[:user_id],group_id: params[:group_id])
		@member = current_user.groups.find(params[:id])
    @member.destroy
		render "killmember.json.jbuilder", status: :removed_permanently
	end

	def memberindex
	    @members = Group.users.where(id: group.id)
	    render  "memberindex.json.jbuilder", status: :found
	end
		
end
