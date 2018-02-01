require 'rails_helper'

describe FacebookEventIdValidationService do
  describe "#perform" do
    context "with valid id" do
      let(:successful_validation) do
        described_class.new(url: GOOD_URL).perform
      end

      it "returns true" do
        expect(succssful_validation).to be
      end
    end

    context "with invalid id" do
      let(:unsuccessful_validation) do
        described_class.new(url: BAD_URL).perform
      end

      it "throws a validation error" do
        expect(unsuccessful_validation).to raise_error(ValidationError)
      end
    end
  end
end
