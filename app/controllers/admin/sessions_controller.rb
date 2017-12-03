class Admin::SessionsController < ApplicationController
  def new; end

  def create
    byebug
    if User.find_by(email: params[:email]).try(:authenticate, params[:password])
      redirect_to :root
    else
      flash[:info] = 'Please enter valid login information'
      render :new
    end
  end
end
