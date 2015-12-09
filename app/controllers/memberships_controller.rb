class MembershipsController < ApplicationController
	

  	def add
    	@member = Member.create(user_id: params[:user_id], group_id: params[:group_id])
		render json: "member.json.jbuilder", status: :ok
	end

	def remove
    	@member = current_user.members.find_by(params[:user_id],params[:group_id])
		@member.destroy
		render json: "killmember.json.jbuilder", status: :ok
	end
	
end
