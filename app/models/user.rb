class User < ActiveRecord::Base
  belongs_to :subscription_level
  has_many :businesses, :dependent => :destroy
  has_one :account
  
  acts_as_authentic
  
  def admin?
    self.admin
  end
  
  def name
    "#{self.first_name}"
  end
end
