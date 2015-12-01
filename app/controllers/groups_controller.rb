class GroupsController < ApplicationController
	def create
		@group = current_user.groups.create(groups_params)
		@member = current_user.members.create(user_id: current_user.id, group_id: @group.id)
	end

	def delete
		@group = current_user.groups.find_by(params[:name])
		@group.distroy
	end
		
	end
	def groups_params
		allow = [:category, :join_password, :public]
		params.require(:name, :owner).permit(allow)
	end
end