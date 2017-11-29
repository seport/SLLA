require 'rails_helper'

describe User do
  let(:user) do
    User.new(
      email: 'example@example.com',
      password: 'password',
      admin: true
    )
  end
  it "validates the presence of email" do
    expect(user.save!).to be
  end
  it "validates the presence of password"
  it "validates the presence of admin"
end
