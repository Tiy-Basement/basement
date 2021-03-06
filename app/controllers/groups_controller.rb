class GroupsController < ApplicationController
	
	def create

		@group = current_user.groups.create(name: params[:name],
													category: params[:category], 
													join_password: params[:join_password],
													owner_id: current_user.id
													)
		if @group.join_password
			@group.update(public: false)
		end
		#todo: if group join_password is given set public to false
		#binding.pry
		#@member = current_user.groups.create(user_id: current_user.id, 
		#														group_id: @group.id)

		if @group.save
			render json: { group: @group }, status: :ok
		else
			render json: { errors: @group.errors.full_messages },
        	status: :unprocessable_entity
		end
	end

	def delete
		@group = Group.find_by(id: params[:id])
		@group.destroy
		render json: { group: @group }, status: :ok
	end
		
	def edit
		@group = Group.find_by(id: params[:id])
		@group.update(name: params[:name],
															category: params[:category], 
															join_password: params[:join_password],
															public: params[:public])
		render json: { group: @group }, status: :ok
	end

	def index
		@groups = Group.all
		render "index.json.jbuilder", status: :ok

	end

	def search
		@results = Group.find_by_sql("SELECT * FROM group WHERE name LIKE '%#{params[:name]}%'")
		render "search.json.jbuilder", status: :ok
	end

	def info
		@group = Group.find_by(id: params[:id])
		@members = @group.users
		render "info.json.jbuilder" , status: :ok
	end

	def groups_params
		allow = [:category, :join_password, :public]
		params.require(:name, :owner_id).permit(allow)
	end
end