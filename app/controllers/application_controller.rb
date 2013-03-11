class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authentication

  def list
    @auth.complete_list == true ? @auth.completed_jobs : @auth.incompleted_jobs
  end

  private
  def authentication
    @auth = User.find(session[:user_id]) if session[:user_id].present?
  end

  def is_logged_in
    redirect_to(root_path) if @auth.nil?
  end

end
