require 'rails_helper'

describe SubmitEventsController do
  describe "GET index" do
    it "is successful" do
      get :index
      expect(response).to be_success
    end
  end

  describe "POST create" do
    context "with valid facebook event" do
      before do
        stub_request(:get, "https://graph.facebook.com/v2.12/134236613927951")
          .to_return(status: 200, body: '{"id": 134236613927951, "name": "My Event"}')
      end

      subject { post :create, params: { event: { fb_url: "facebook.com/events/134236613927951" } } } 

      it "saves the new facebook event" do
        subject
        expect(Event.count).to eq(1)
      end

      it "redirects to the submit page" do
        expect(subject).to redirect_to(submit_path)
      end
      
      it "displays a flash message telling the user they successfull created a new event" do
        subject
        expect(flash[:success]).to be_present
      end
    end

    context "with invalid facebook event" do
      it "displays a flash message regarding the bad event given" do
        stub_request(:get, "https://graph.facebook.com/v2.12/134236613927952")
          .to_return(status: 404, body: '{"error": {}}')
        post :create, params: { event: { fb_url: "facebook.com/events/134236613927952" } }
        expect(flash[:error]).to be_present
      end
    end
  end
end