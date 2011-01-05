class UsersController < ApplicationController
  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => [:show, :edit, :update]

  def new
    @title = "Register Account"
    @header = "Register Your Account"
    @user = User.new
    render :layout => 'site'
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "Account registered!"
      redirect_back_or_default account_url
    else
      render :action => :new
    end
  end

  def show
    @title = "My Account"
    @user = @current_user
    render :layout => 'admin'
  end

  def edit
    @title = "Edit Account Info"
    @user = @current_user
    render :layout => 'edit'
  end

  def update
    @user = @current_user # makes our views "cleaner" and more consistent
    if @user.update_attributes(params[:user])
      flash[:notice] = "Account updated!"
      redirect_to account_url
    else
      render :action => :edit
    end
  end
end
