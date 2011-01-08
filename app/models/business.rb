class Business < ActiveRecord::Base
  belongs_to  :user
  has_one :address, :as => :addressable
  
  # has_one :coupon
  # has_one :survey
  
  acts_as_geocodable :address => {:street => :line_1, :locality => :city, :region => :state, :postal_code => :zip}
  accepts_nested_attributes_for :address
  
  validates_presence_of :name, :phone, :address
end
