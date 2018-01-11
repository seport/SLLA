class Admin::SessionsController < ApplicationController
  before_action :require_admin_login, only: :index
  before_action :redirect_if_logged_in, except: :index

  def new; end

  def index
    render plain: "Hello World!"
  end

  def create
    user = User.find_by(email: params[:email])

    if user.try(:authenticate, params[:password])
      session[:user_id] = user.id
      redirect_to admin_path
    else
      render_login_error
    end
  end
end
