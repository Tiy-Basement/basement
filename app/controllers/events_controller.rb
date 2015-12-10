class EventsController < ApplicationController

  def create
    @event = Event.new(title: params[:title],
                       start: params[:start],
                       end: params[:end],
                       location: params[:location],
                       note: params[:note],
                       user_id: current_user.id,
                       group_id: params[:group_id]
                        )
      if @event.save
        render "create.json.jbuilder", status: :created
        # render json: { user: @user }, status: :ok
          # status: 201
      else
        render json: { errors: @user.errors.full_messages },
          status: :unprocessable_entity
          # status: 422
      end
    end
    #code to send text/email alert goes here

  def edit
    @event = Group.update_all(title: params[:title],
                       start: params[:start],
                       end: params[:end],
                       location: params[:location],
                       note: params[:note],
                       user_id: current_user.id,
                       group_id: params[:group_id])

    render json: { event: @event }, status: :ok
  end

  def delete
    @event = Event.find(id: params[:id])
    @event.destroy
  end

  def user_event_index
    #@user = User.find_by(id: params[:id]) #need to implement query params for start and end
    binding.pry
    @events = current_user.events
    #@events = @user.events.all
    render "userindex.json.jbuilder", status: :ok
  end

  def group_event_index
    @group = Group.find_by(id: params[:group_id])
    @events = @group.events.all
    render "groupindex.json.jbuilder"
  end

  def calendar_event_index
   @events = current_user.events.where(start: params[:start],
                                       end: params[:end])
  render "caluserindex.json.jbuilder", status: :ok
end

end