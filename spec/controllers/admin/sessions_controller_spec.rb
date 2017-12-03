require "rails_helper"

describe Admin::SessionsController do

  describe "POST create" do
    context "with valid email" do
      it "should assign a user" do
        User.create(email: 'example@example.com', password: 'password', admin: true)
        post :create, params: { email: 'example@example.com', password: 'password' }
        expect(assigns(:user)).to be_instance_of(User)
      end
    end

    context "with invalid email" do
      it "shows a message regarding an invalid email" do
        User.create(email: 'example@example.com', password: 'password', admin: true)
        post :create, params: { email: 'stuff@example.com', password: 'password' }
        expect(flash[:info]).to eq('Please enter a valid email address')
      end
    end

    context "with valid credentials" do
    end

    context "with invalid credentials" do

    end

    it "should authenticate user"
    it "should redirect to welcome page"
  end
end
