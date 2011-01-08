class UsersController < ApplicationController
  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => [:show, :edit, :update]

  def new
    @title = "Register Account"
    @header = "Register Your Account"
    @user = User.new
    authorize! :create, @user
    
    respond_to do |format|
      format.html { render :layout => 'site' }# new.html.erb
      format.xml  { render :xml => @user }
    end
  end

  def create
    @user = User.new(params[:user])
    
    # all account register shit here

    respond_to do |format|
      if @user.valid?
        format.html { redirect_back_or_default(login_path, :notice => 'User was successfully created!') }
        format.xml  { render :xml => @user, :status => :created, :location => @user }
      else
        format.html { redirect_to(new_user_path, :notice => @user.errors) }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  def show
    @title = "My Account"
    @user = User.find(params[:id])
    authorize! :read, @user
    
    respond_to do |format|
      format.html { render :layout => 'admin' } # show.html.erb
      format.xml  { render :xml => @user }
    end
  end

  def edit
    @title = "Edit Account Info"
    @user = User.find(params[:id])
    authorize! :update, @user
    
    render :layout => 'edit'
  end

  def update
    #@user = @current_user
    #custom code for user update method
  
    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to(@user, :notice => 'User was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @user = User.find(params[:id])
    authorize! :create, @user
    @user.destroy

    respond_to do |format|
      format.html { redirect_to(login_path, :notice => "Account Closed :()") }
      format.xml  { head :ok }
    end
  end
end
