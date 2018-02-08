require 'rails_helper'

describe FacebookEventIdValidationService do
  describe "#perform" do
    context "with valid id" do
      let(:successful_validation) do
        validation_service = FacebookEventIdValidationService.new("graph.facebook.com/v2.12/1234567890")
        validation_service.perform do
          stub_request(:get, "/v2.12/1234567890")
                     .with(headers: { Host: 'graph.facebook.com/v2.12/' })
                     .to_return(body: '{"id": 1234567890, "name": "My Event"}')
        end
      end

      it "returns true" do
        response = JSON.parse(successful_validation)
        expect(response["id"]).to eq(1234567890)
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
