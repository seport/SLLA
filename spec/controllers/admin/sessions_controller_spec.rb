require "rails_helper"

describe Admin::SessionsController do

  describe "POST create" do
    context "with valid email" do
      it "should assign a user" do
        User.create(email: 'example@example.com', password: 'password')
        post :create, params: { email: 'example@example.com', password: 'password' }
        expect(assigns(:user)).to be_instance_of(User)
      end
    end

    context "with invalid email" do
      # it "should a message regarding an invalid email" do
      #
      # end
    end

    context "with valid credentials" do
    end

    context "with invalid credentials" do

    end

    it "should authenticate user"
    it "should redirect to welcome page"
  end
end
