class Coupon < ActiveRecord::Base
  belongs_to  :user
  belongs_to  :business
  
  validates_presence_of :name, :terms, :days_until_expiration
end