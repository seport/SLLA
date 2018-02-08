class Admin::AdminController < ApplicationController
  before_action :require_admin_login, only: :index

  def index
    @user = User.find(current_user).email

    @events = [
      {
        id: 1,
        fb_id: '4f3817489',
        created_at: Time.now,
        updated_at: Time.now,
      },
      {
        id: 2,
        fb_id: 'fajsdklfas',
        created_at: 1.day.ago,
        updated_at: 1.day.ago,
      }
    ]
  end
end
