class SessionController < ApplicationController
  before_filter :is_logged_in, :only => [:destroy]

  def new
  end

  def create
    user = User.where( :username => params[:username] ).first();

    if user.present? && user.authenticate( params[:password] )
      session[:user_id] = user.id
      redirect_to( welcome_index_path )
    else
      flash[:notice] = "Oops. Looks like something went wrong."
      render :new
    end

  end

  def destroy
    session[:user_id] = nil
    redirect_to( root_path )
  end
end
