class Admin::SessionsController < ApplicationController
  def new; end

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
