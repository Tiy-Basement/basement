class MembershipsController < ApplicationController
	
#cary is sending us Access-Token, Group Name, Join Password
  	def add
      @member = current_user
  		@group = Group.find_by(name: params[:name])
  		@member.groups << @group
		render "member.json.jbuilder", status: :created
	end

	def remove
		@group = Groups_Users.where(user_id: params[:user_id], group_id: params[:id]).delete_all
		#@group.delete
		render "killmember.json.jbuilder", status: :removed_permanently
	end

	def memberindex
      @group = Group.find(params[:id])
      #binding.pry
	    @members = @group.users
	    render  "memberindex.json.jbuilder", status: :found
	end
		
end
