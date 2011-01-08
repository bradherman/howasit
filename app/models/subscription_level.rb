class SubscriptionLevel < ActiveRecord::Base
  has_many  :users
end