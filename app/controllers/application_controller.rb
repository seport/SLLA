class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def render_login_error
    render js: "$('.alert.failure.pre').show();", status: 401
  end
end
