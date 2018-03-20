require "rails_helper"

feature "Submit Event" do
  scenario "with a valid facebook url" do
    stub_request(:get, "https://graph.facebook.com/v2.12/134236613927951?access_token=#{ENV['FB_TOKEN']}")
    .with(headers: {
       'Accept' => '*/*',
       'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
       'Host' => 'graph.facebook.com',
       'User-Agent'=>'Ruby'
     }).to_return(status: 200, body: '{"id": 134236613927951, "name": "My Event"}', headers: {})
    visit submit_path
    expect(page).to have_text "Submit"
    fill_in "event_fb_id", with: 'facebook.com/events/134236613927951'
    click_button "Submit"
    expect(page).to have_text "Your event is awaiting moderation."
  end

  scenario "with an invalid facebook url" do
    stub_request(:get, "https://graph.facebook.com/v2.12/134236613927951?access_token=#{ENV['FB_TOKEN']}")
    .with(headers: {
       'Accept' => '*/*',
       'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
       'Host' => 'graph.facebook.com',
       'User-Agent'=>'Ruby'
     }).to_return(status: 404, body: '{"error": {}}', headers: {})
    visit submit_path
    expect(page).to have_text "Submit"
    fill_in "event_fb_id", with: 'facebook.com/events/134236613927951'
    click_button "Submit"
    expect(page).to have_text "That event is not available."
  end
end
