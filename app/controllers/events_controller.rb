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
  end

  def delete
  end

  def user_event_index
    @user = User.find(id: params:[:user_id])
    @events = @user.events.all
    render "userindex.json.jbuilder", status: :ok
  end

  def group_event_index
    @group = Group.find(id: params[:group_id])
    @events = @group.events.all
    render "groupindex.json.jbuilder"
  end

end