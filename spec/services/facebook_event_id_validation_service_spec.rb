require 'rails_helper'

describe FacebookEventIdValidationService do
  describe "#perform" do
    context "with valid id" do
      let(:successful_validation) do
        validation_service = FacebookEventIdValidationService.new("https://graph.facebook.com/v2.12/1234567890")
        stub_request(:get, "https://graph.facebook.com/v2.12/1234567890")
                   .with(headers: {
                      'Accept' => '*/*',
                      'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
                      'Host' => 'graph.facebook.com',
                      'User-Agent'=>'Ruby'
                    }).to_return(status: 200, body: '{"id": 1234567890, "name": "My Event"}', headers: {})
        validation_service.perform
      end

      it "returns a response with an event name" do
        response = JSON.parse(successful_validation)
        expect(response['name']).to eq('My Event')
      end
    end

    # context "with invalid id" do
    #   let(:unsuccessful_validation) do
    #     described_class.new(url: "BAD_URL").perform
    #   end
    #
    #   it "throws a validation error" do
    #     expect(unsuccessful_validation).to raise_error(ValidationError)
    #   end
    # end
  end
end
