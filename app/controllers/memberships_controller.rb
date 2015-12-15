class MembershipsController < ApplicationController
	
#cary is sending us Access-Token, Group Name, Join Password
  	def add
      @member = current_user
  		@group = Group.find_by(name: params[:name])
  		@member.groups << @group
		render "member.json.jbuilder", status: :created
	end

	def remove
		@member = current_user.groups.find(params[:id])
    	@member.destroy
		render "killmember.json.jbuilder", status: :removed_permanently
	end

	def memberindex
	    @members = Group.users.where(id: group.id)
	    render  "memberindex.json.jbuilder", status: :found
	end
		
end
