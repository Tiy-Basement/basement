class GroupsController < ApplicationController
	
	def create
		@group = Group.create(name: params[:name],category: params[:category], join_password: params[:join_password],
												public: params[:public])
		#todo: if group join_password is given set public to false

		@member = Member.create(user_id: params[:owner_id], group_id: @group.id)

		if @group.save
			render json: { group: @group }, status: :ok
		else
			render json: { errors: @group.errors.full_messages },
        	status: :unprocessable_entity
		end
	end

	def delete
		@group = Group.find_by(params[:name])
		@group.destroy
		render json: { group: @group }, status: :ok
	end
		
	def edit
		@group = Group.update_all(name: params[:name],category: params[:category], join_password: params[:join_password],
												public: params[:public])
		render json: { group: @group }, status: :ok
	end

	def index
		@groups = current_user.groups.order("name")
		render "index.json.jbuilder", status: :ok

	end

	def addmember
		@member = Member.create(user_id: params[:user_id], group_id: params[:group_id])
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