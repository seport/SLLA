require 'rails_helper'

describe Event do
  describe "#validate_facebook_event" do 
    it "should populate errors array when an event is invalid" do
      stub_request(:get, "https://graph.facebook.com/v2.12/134236613927952")
      .with(headers: {
        'Accept' => '*/*',
        'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
        'Host' => 'graph.facebook.com',
        'User-Agent'=>'Ruby'
      }).to_return(status: 404, body: '{"error": {}}', headers: {})
      event = Event.new(fb_id: '134236613927952')
      event.valid?
      expect(event.errors[:fb_id]).to include("This facebook event isn't available.")
    end

    it "should returns nil on successful facebook validation" do
      stub_request(:get, "https://graph.facebook.com/v2.12/134236613927951")
      .with(headers: {
         'Accept' => '*/*',
         'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
         'Host' => 'graph.facebook.com',
         'User-Agent'=>'Ruby'
       }).to_return(status: 200, body: '{"id": 134236613927951, "name": "My Event"}', headers: {})
      event = Event.new(fb_id: '134236613927951')
      event.valid?
      expect(event.errors[:fb_id]).to be_empty
    end
  end

  describe "#parse_fb_id" do
    it "should set facebook id" do
      event = Event.new(fb_id: "123456789012345")
      event.parse_fb_id
      expect(event.fb_id).to eq("123456789012345")
    end
  end
end
