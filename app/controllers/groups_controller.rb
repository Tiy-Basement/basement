class GroupsController < ApplicationController
	
	def create
		groups_params[owner_id: current_user.id]
		@group = current_user.groups.create(groups_params)
		#todo: if group join_password is given set public to false

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
		render json: { group: @group }, status: :ok
	end
		
	def edit
		groups_params[owner_id: current_user.id]
		@group = current_user.groups.update_all(groups_params)
		render json: { group: @group }, status: :ok
	end

	def index
		@groups = current_user.groups.order("name")
		render "index.json.jbuilder", status: :ok
		render json: { group: @group }, status: :ok
	end

	def addmember
		@member = current_user.members.create(user_id: current_user.id, group_id: @group.id)
		render json: { member: @member }, status: :ok
	end

	def deletemember
		@member = current_user.members.find_by(params[:user_id],params[:group_id])
		@member.destroy
		render json: { member: @member }, status: :ok
	end

	def groups_params
		allow = [:category, :join_password, :public]
		params.require(:name, :owner_id).permit(allow)
	end
end