require 'rails_helper'

describe Event do
  it "should validate format of facebook id" do
    expect do
      Event.create!(fb_id: '12345')
    end.to raise_error(ActiveRecord::RecordInvalid)
  end

  describe "#parse_fb_id" do
    it "should set facebook id" do
      event = Event.new(fb_id: "facebook.com/events/123456789012345")
      event.parse_fb_id
      expect(event.fb_id).to eq("123456789012345")
    end
  end
end
