require 'rails_helper'

describe User do
  it "validates the presence of email" do
    user = User.new(password: "password", admin: true)
    expect(user.invalid?).to eq(true)
  end

  it "validates the presence of password" do
    user = User.new(email: 'example@example.com', admin: true)
    expect(user.invalid?).to eq(true)
  end

  it "validates the presence of admin" do
    user = User.new(email: 'example@example.com', password: 'password')
    expect(user.invalid?).to eq(true)
  end
end
