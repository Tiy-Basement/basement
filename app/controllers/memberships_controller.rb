class MembershipsController < ApplicationController
	

  	def add
    	@member = Groups_user.create(user_id: params[:user_id], 
                              group_id: params[:group_id])
		render json: "member.json.jbuilder", status: :ok
	end

	def remove
    	@member = current_user.members.find_by(user_id: params[:user_id],group_id: params[:group_id])
		@member.destroy
		render json: "killmember.json.jbuilder", status: :ok
	end

  def memberindex
    @members = Groups_Users.all
    render json: "memberindex.json.jbuilder", status: :ok
  end
	
end
