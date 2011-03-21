class Ability
  include CanCan::Ability
  
  def initialize(user)
    user ||= User.new # guest user
    # user ||= current_user ||= User.new
    
    # blog abilities
    can :read, [BlogPost, BlogComment]
    can :create, BlogComment    
    # can :read, [Business, Survey]  -- Need to namespace
    can :read, Survey
    can :read, Coupon
    can :create, User
    can :manage, UserSession
    
    if user.admin?                                              # admin user
      can :manage, :all
    elsif user.login                                            # registered user
      can [:update, :read, :destroy], User do |u| 
        u.id == user.id
      end
      can :create, Business
      can [:update, :destroy, :read], Business do |b| 
        b.user_id == user.id
      end
      can :create, Survey
      can [:update, :destroy], Survey do |s|
        s.user_id == user.id
      end
      can :create, Coupon
      can [:update, :destroy], Coupon do |c|
        c.user_id == user.id
      end
            
      # coupon model
    else
      # non-registered user
    end
    
    # unauthorized! if cannot? :edit, @user
    # load_and_authorize_resource   in controller, can remove set instance
    # load_and_authorize_resource :nested => "businesses"  -- for nested resources
  end
end