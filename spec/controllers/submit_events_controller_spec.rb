require 'rails_helper'

describe SubmitEventsController do
  describe "GET index" do
    it "assigns @event"
  end

  describe "POST create" do
    it "assigns @event"

    context "valid facebook event" do
      it "saves the new facebook event"
      it "redirects to the submit page"
      it "displays a flash message telling the user they successfull created a new event"
    end

    context "invalid facebook event" do
      it "displays a flash message regarding the bad event given"
    end
  end
end