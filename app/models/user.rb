class User < ActiveRecord::Base
  has_one :subscription_level
  
  acts_as_authentic
  
  def admin?
    self.admin
  end
  
  def name
    "#{self.first_name}"
  end
end
