class Business < ActiveRecord::Base
  belongs_to  :user
    
  # has_one :coupon
  # has_one :survey
  
  validates_presence_of :name, :phone, :street, :locality, :region, :postal_code
end
