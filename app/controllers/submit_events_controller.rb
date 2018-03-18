class SubmitEventsController < ApplicationController
  def index
    @event = Event.new
  end
  def create
    @event = Event.new(event_params)
    if @event.save
      flash[:success] = "Your event is awaiting moderation."
      redirect_to submit_path
    else
      render 'index'
    end
  end
  private
  def event_params
    params.require(:event).permit(:fb_url)
  end
end
