require 'digest/sha1'

class UserSessionsController < ApplicationController
  helper "fb_connect"
  before_filter :require_user, :only => :destroy
  SALT = "n12kjed982nkjwe9a8njkna98dakjndniu98ykjn9871y2"
  
  def new
    @user = User.new
    @user_session = UserSession.new
  end
  
  def create
    @user_session = UserSession.new(params[:user_session])

    # @user = @user_session.attempted_record
    # # create a temporary password for a fb registered user
    # Rails.logger.info("%s %s %s %s" % [@user.new_record?, @user.password.nil?, !@user.facebook_session.andand.empty?, !@user.facebook_uid.andand.empty?])
    # if (@user.new_record? && !@user.facebook_session.andand.empty? && !@user.facebook_uid.andand.empty?) && @user.password.nil?
    #   Rails.logger.info("setting a password")
    #   tmp_pass = Digest::SHA1.hexdigest(Time.now.to_s + SALT)
    #   @user.password = tmp_pass
    #   @user.password_confirmation = tmp_pass
    # end

    if @user_session.save
      flash[:notice] = "Login successful!"
      redirect_back_or_default "/"
    else
      render :action => :new
    end
  end
  
  def destroy
    current_user_session.destroy
    flash[:notice] = "Logout successful!"
    redirect_back_or_default new_user_session_url
  end
end
