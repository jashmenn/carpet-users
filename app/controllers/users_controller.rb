class UsersController < ApplicationController
  before_filter :find_user_by_current_user, :only => [:edit, :update, :destroy]
  before_filter :find_user_by_identifier, :only => [:show]
  load_and_authorize_resource

  unloadable
  helper "fb_connect"
  before_filter :require_user, :only => [:show, :edit, :update]
  before_filter :require_no_user, :only => [:new, :create]
  
  def new
    @user = User.new
    @user_session = UserSession.new
  end
  
  def create
    @user = User.new(params[:user])
    @user_session = UserSession.new
    if @user.save
      flash[:notice] = "Account registered!"
      redirect_back_or_default account_url
    else
      render :action => :new
    end
  end
  
  def show
  end

  def edit
  end
  
  def update
    if @user.update_attributes(params[:user])
      flash[:notice] = "Account updated!"
      redirect_to account_url
    else
      render :action => :edit
    end
  end

  private
  def find_user_by_current_user
    # todo, if you want moderators to edit other users this will need to change
    @user = current_user # makes our views "cleaner" and more consistent
  end

  def find_user_by_identifier
    @user = User.find_by_identifier(params[:id]) || current_user
  end



end
