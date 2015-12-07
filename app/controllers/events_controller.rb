class EventsController < ApplicationController

def create
  @event = Event.new(title: params[:title],
                     start: params[:start],
                     location: params[:test],
                     note: params[:note],
                     end: params[:end],
                     
                      )
    if @user.save
      render "create.json.jbuilder", status: :created
      # render json: { user: @user }, status: :ok
        # status: 201
    else
      render json: { errors: @user.errors.full_messages },
        status: :unprocessable_entity
        # status: 422
    end
  end
end

def edit
end

def delete
end

def index
end