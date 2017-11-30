class SubmitEventsController < ApplicationController
  def index
    @event = Event.new
  end
  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to '/submit'
    else
      render 'index'
    end
  end
  private
  def event_params
    params.require(:event).permit(:fb_id)
  end
end
