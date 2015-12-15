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
        if @event == nil
           render json: { errors: @user.errors.full_messages }
        else
        render "create.json.jbuilder", status: :created
        # render json: { user: @user }, status: :ok
          # status: 201
        end
      else
        render json: { errors: @user.errors.full_messages }
         
          # status: 422
      end
    #code to send text/email alert goes here
  end

  def groupcreate
    @event = Event.new(title: params[:title],
                       start: params[:start],
                     end: params[:end],
                     location: params[:location],
                     note: params[:note],
                     user_id: current_user.id,
                     group_id: params[:id])
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
    @event = Event.find(params[:id])
    #binding.pry
    @event.destroy
     render json: { errors: @user.errors.full_messages }
  end

  def user_event_index
    #@user = User.find_by(id: params[:id]) #need to implement query params for start and end
    @events = Event.where(user_id: params[:id])
    #binding.pry
    #@events = @user.events.all

    #@events = current_user.events
    render "userindex.json.jbuilder", status: :ok
  end

  def event_index
    @events = Event.all
    render "alleventindex.json.jbuilder", status: :ok
  end

  def calendar_event_index
   @events = current_user.events.where
  render "caluserindex.json.jbuilder", status: :ok
  end

  def find_id
    @event = Event.find_by(title: params[:title])
    render "id.json.jbuilder", status: :ok
  end

def groupevents
  @events = Event.where(group_id: params[:id])
  render "events.json.jbuilder", status: :ok
  #use already created template?
end

def member_events_index
  @group = Group.where(group_id: params[:id])
  @events = @group.member_events
  render @events, status: :found

end

end