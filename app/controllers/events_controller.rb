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

  def groupcreate
    @event = Event.new(title: params[:title],
                       start: params[:start],
                     end: params[:end],
                     location: params[:location],
                     note: params[:note],
                     user_id: current_user.id,
                     group_id: :id)
    if @event.save
      render "create.json.jbuilder", status: :created
    else
      render json: {errors: @user.errors.full_messages}
    end
  end

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
    #binding.pry
    @events = current_user.events
    #@events = @user.events.all
    render "userindex.json.jbuilder", status: :ok
  end

  def group_event_index
    #@group = Group.find_by(id: :id)
    @events = Event.find_by(group_id: :id)
    render "groupindex.json.jbuilder"
  end

  def calendar_event_index
   @events = current_user.events.where(start: params[:start],
                                       end: params[:end])
  render "caluserindex.json.jbuilder", status: :ok
  end

  def find_id
    @event = Event.find_by(title: params[:title])
    render "id.json.jbuilder", status: :ok
  end

def groupevents
  @events = Event.where(group_id: params[:group_id])
  render "events.json.jbuilder", status: :found
end

def memberevents

  @events = Group.events.where(user_id: params[:user_id])
  render "events.json.jbuilder", status: :found
end

end