class NotesController < ApplicationController
	def create

		@note = current_user.notes.create(notes_params)

		if @note.save
			render json: { note: @note }, status: :ok
		else
			render json: { errors: @note.errors.full_messages },
        	status: :unprocessable_entity
		end
	end

	def delete
		@note = current_user.notes.find_by(params[:note_id])
		@note.destroy
		render json: { note: @note }, status: :ok
	end

	def show
		@note = notes.find_by(params[:note_id])
		render json: { note: @note }, status: :ok
	end

	def edit
		@note = current_user.notes.update_all(notes_params)
		render json: { note: @note }, status: :ok
		
	end

	def notes_params
		allow = [:content, :color]
		params.require(:title, :user_id, :event_id).permit(allow)
	end
end