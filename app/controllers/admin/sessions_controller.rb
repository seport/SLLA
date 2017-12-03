class Admin::SessionsController < ApplicationController
  def new; end

  def create
    @user = User.find_by(email: params[:email])
    if @user&.authenticate(params[:password])
    end
  end
end
