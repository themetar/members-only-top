class ApplicationController < ActionController::Base
  before_action :current_user

  def current_user
    @current_user ||= User.find_by(remember_digest: User.digest(cookies[:user_token].to_s))
  end

  def current_user=(user)
    @current_user = user
  end
end
