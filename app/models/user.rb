class User < ActiveRecord::Base
<<<<<<< HEAD
  #has_one :subscription_level
=======
  belongs_to :subscription_level
  has_many :businesses, :dependent => :destroy
>>>>>>> business
  has_one :account
  
  acts_as_authentic
  
  validates_presence_of :first_name, :last_name, :phone
  
  def admin?
    self.admin
  end
  
  def name
    "#{self.first_name}"
  end
end
