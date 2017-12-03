require "rails_helper"

describe Admin::SessionsController do
  describe "POST create" do
    context "with invalid credentials" do
      it "shows a message about invalid email or password with bad email" do
        User.create(email: 'example@example.com', password: 'password', admin: true)
        post :create, params: { email: 'stuff@example.com', password: 'password' }
        expect(response.status).to eq(401)
      end

      it "shows a message about invalid email or password with bad password" do
        User.create(email: 'example@example.com', password: 'password', admin: true)
        post :create, params: { email: 'example@example.com', password: '12345' }
        expect(response.status).to eq(401)
      end
    end
  end
end
