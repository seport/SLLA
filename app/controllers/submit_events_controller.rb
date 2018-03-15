class SubmitEventsController < ApplicationController
  def index
    @event = Event.new
  end
  def create
    @event = Event.new(event_params)
    @event.parse_fb_id
    @event.validate_facebook_id
    # handle situation where there is a bad facebook event here and in spec
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
