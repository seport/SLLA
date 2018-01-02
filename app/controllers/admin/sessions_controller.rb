class Admin::SessionsController < ApplicationController
  before_action :require_admin_login, only: :index

  def new; end

  def index
    render plain: "Hello World!"
  end

  def create
    user = User.find_by(email: params[:email])
    if user.try(:authenticate, params[:password])
      session[:user_id] = user.id
      redirect_to :root
    else
      render_login_error
    end
  end
end
