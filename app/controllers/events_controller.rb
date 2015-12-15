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
    @event = Event.find(id: params[:id])
    @event.destroy
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
    render "groupindex.json.jbuilder", status: :ok
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
  #use already created template?
end

def memberevents
  @users = Group.users.where(id: params[:group_id])
  @users.each do |user|
    @events = Event.where(user_id: user.id)
    #append to all events
    #note to self
    #append results to temp table or render each group of user events as a partial?
  end

  
  render "events.json.jbuilder", status: :found
end

end