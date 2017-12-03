class Admin::SessionsController < ApplicationController
  def new; end

  def create
    binding.pry
    @user = User.new()
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
