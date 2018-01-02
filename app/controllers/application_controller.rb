class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def render_login_error
    render js: "$('.alert.failure.pre').show();", status: 401
  end

  private

  def require_admin_login
    redirect_to admin_login_path if !(logged_in? || admin?)
  end

  def current_user
    session[:user_id]
  end

  def logged_in?
    current_user.present?
  end

  def admin?
    current_user && User.find(current_user).admin?
  end
end
