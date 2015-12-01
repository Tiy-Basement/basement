class GroupsController < ApplicationController
	
	def create
		groups_params[owner_id: current_user.id]
		@group = current_user.groups.create(groups_params)
		@member = current_user.members.create(user_id: current_user.id, group_id: @group.id)

		if @group.save
			render json: { group: @group }, status: :ok
		else
			render json: { errors: @group.errors.full_messages },
        	status: :unprocessable_entity
		end
	end

	def delete
		@group = current_user.groups.find_by(params[:name])
		@group.destroy
	end
		
	def edit
		groups_params[owner_id: current_user.id]
		@group = current_user.groups.update_all(groups_params)
	end

	def index
		@groups = current_user.groups.order("name")
		render "index.json.jbuilder", status: :ok
	end
	
	def groups_params
		allow = [:category, :join_password, :public]
		params.require(:name, :owner_id).permit(allow)
	end
end