class Admin::SessionsController < ApplicationController
  def new; end

  def create
    @user = User.find_by(email: params[:email])
    if @user.nil?
      flash[:info] = 'Please enter a valid email address'
      render(:new) and return
    end
    # if @user&.authenticate(params[:password])
    # end
  end
end
