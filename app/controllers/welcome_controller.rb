class WelcomeController < ApplicationController
  before_filter :is_logged_in, :except => [:splash]
  layout 'splash', :only => [:splash]

  def index
    @auth.complete_list = false
    @auth.save
    @jobs = list if @auth.has_jobs?
  end

  def splash
  end
end