class Admin::SessionsController < ApplicationController
  def new; end

  def create
<<<<<<< HEAD
    @user = User.find_by(email: params[:email])
    if @user&.authenticate(params[:password])
    end
=======
    binding.pry
    @user = User.new()
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
>>>>>>> 77aeab72ccdb7beadb5e1f7638bbbd686d02154c
  end
end
