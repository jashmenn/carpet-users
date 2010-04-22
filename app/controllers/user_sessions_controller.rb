class UserSessionsController < ApplicationController
  rescue_from('Exception'){ |e| logger.info(e.to_s + e.backtrace.pretty_inspect) }
  helper "fb_connect"
  before_filter :require_user, :only => :destroy
  
  def new
    @user = User.new
    @user_session = UserSession.new

    # redirect to user logged in 
    if current_user 
      redirect_to account_url
    end
  end
  
  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      flash[:notice] = "Login successful!"
      redirect_back_or_default "/"
    else
      Rails.logger.info(@user_session.errors.pretty_inspect)
      render :action => :new
    end
  end
  
  def destroy
    current_user_session.destroy
    flash[:notice] = "Logout successful!"
    redirect_back_or_default new_user_session_url
  end
end
