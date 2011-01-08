class UsersController < ApplicationController
  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => [:show, :edit, :update]
  load_and_authorize_resource

  def new
    @title = "Register Account"
    @header = "Register Your Account"
    #@user = User.new
    
    respond_to do |format|
      format.html { render :layout => 'site' }# new.html.erb
      format.xml  { render :xml => @user }
    end
  end

  def create
    #@user = User.new(params[:user])
    
    # all account register shit here

    respond_to do |format|
      if @user.valid?
        format.html { redirect_back_or_default(login_path, :notice => 'User was successfully created!') }
        format.xml  { render :xml => @user, :status => :created, :location => @user }
      else
        format.html { render :action => "new", :layout => "site" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  def show
    @title = "My Account"
    #@user = @current_user
    render :layout => 'admin'
    
    respond_to do |format|
      format.html { render :layout => 'admin' } # show.html.erb
      format.xml  { render :xml => @user }
    end
  end

  def edit
    @title = "Edit Account Info"
    #@user = @current_user
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
  
  ############## Recurly Stuff ##################
  ###############################################
  
  
  def create_account
    @user = User.new  # change to new user model
    
    acct = Recurly::Account.create(
      :account_code => @user.email,
      :username => @user.username,
      :email => @user.email,
      :first_name => @user.first_name,
      :last_name => @user.last_name
    )
  end
  
  def update_account
    @user = User.find(params[:user_id])
    
    acct = Recurly::Account.find(@user.email)
    acct.email = new_email_address
    acct.save
  end
  
  def destroy_account
    user = User.find(params[:user_id])
    acct = Recurly::Account.find(user.email)
    acct.close_account unless acct.nil?
  end
  
  def create_or_update_billing_info(user)
    user ||= User.find(params[:user_id])        #change
    account = Recurly::Account.find(user.email) #change
    
    billing_info = Recurly::BillingInfo.create(
      :account_code => account.account_code,
      :first_name => params[:billing_info][:first_name],
      :last_name => params[:billing_info][:last_name],        # load from form
      :address1 => params[:billing_info][:address1],
      :address2 => params[:billing_info][:address2],
      :city => params[:billing_info][:city],
      :state => params[:billing_info][:state],
      :zip => params[:billing_info][:zip],
      :ip_address => params[:billing_info][:ip_address],
      :credit_card => {
        :number => params[:billing_info][:number],
        :year => params[:billing_info][:year],
        :month => params[:billing_info][:month],
        :verification_value => params[:billing_info][:verification_value]
      }
    )
  end
  
  def destroy_billing_info
    user = User.find(params[:user_id])
    billing_info = Recurly::BillingInfo.find(user.email)
    billing_info.destroy unless billing_info.nil?
  end
  
  def billing_history
    @charges = Recurly::Charge.list(acct.account_code)
    # id, account_code, amount_in_cents, :start_date, :end_date, :description, :created_at
  end
  
  def invoice_history
    @invoices = Recurly::Invoice.list(acct.account_code)
    #@invoice = Recurly::Invoice.find(invoice_id)
  end
  
  def list_plans
    plans = Recurly::Plan.find(:all)
    #plan = Recurly::Plan.find(PLAN_CODE)
  end
  
  def subscription
    user = User.find(params[:user_id])
    subscription = Recurly::Subscription.find(user.email)
  end
  
  def create_subscription
    account = Recurly::Account.find(params[:user_id])
    
    sub = Recurly::Subscription.create(
      :account_code => account.account_code,
      :plan_code => params[:plan_code], 
      :quantity => 1,
      :account => account
    )
  end
  
  def destroy_subscription
    Recurly::Subscription.delete(acct.account_code)
  end
  
  def update_subscription
    #subscription = Recurly::Subscription.find(acct.account_code)
    #subscription.change('now', :plan_code => 'silver', _:quantity => 2)
    #subscription[timeframe] --- "now", "renewal"
    #subscription[plan_code]
    #subscription[quantity]
    #subscription[add_ons]
    #add_on[add_on_code]
    #add_on[unit_amount_in_cents]
  end
end
