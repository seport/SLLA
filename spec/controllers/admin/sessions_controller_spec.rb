require "rails_helper"

describe Admin::SessionsController do
  describe "POST create" do
    context "with invalid credentials" do
      it "shows a message about invalid email or password with bad email" do
        User.create(email: 'example@example.com', password: 'password', admin: true)
        post :create, params: { email: 'stuff@example.com', password: 'password' }
        expect(flash[:info]).to eq('Please enter valid login information')
      end

      it "shows a message about invalid email or password with bad password" do
        User.create(email: 'example@example.com', password: 'password', admin: true)
        post :create, params: { email: 'example@example.com', password: '12345' }
        expect(flash[:info]).to eq('Please enter valid login information')
      end
    end
  end
end
