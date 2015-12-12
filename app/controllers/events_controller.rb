class EventsController < ApplicationController
  before_action :set_event, only: [:show, :update, :destroy]

  def index
    @events = Event.all
    render_json(@events)
  end

  def show
    render_json(@event)
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      render_json(@event, :created)
    else
      render_json(@event.errors, :unprocessable_entity)
    end
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      head :no_content
    else
      render_json(@event.errors, :unprocessable_entity)
    end
  end

  def destroy
    @event.destroy
    head :no_content
  end

  private

    def set_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit(:name, :description, :latitude, :longitude, :radius)
    end
end
