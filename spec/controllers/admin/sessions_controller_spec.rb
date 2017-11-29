require "rails_helper"

describe Admin::SessionsController do

  describe "POST create" do
    it "should assign a user" do
      @user = User.new(email: "example@example.com", password: "pw", admin: true)
      post :create
      expect(assigns(:user)).to be
    end
    it "should authenticate user"
    it "should redirect to welcome page"
  end
end
