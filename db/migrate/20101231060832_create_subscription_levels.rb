class CreateSubscriptionLevels < ActiveRecord::Migration
  def self.up
    create_table :subscription_levels do |t|
      t.string  :name
      t.integer :business_limit
      t.integer :coupon_limit
      t.integer :survey_limit
      t.integer :count
      t.boolean :slug_enabled
      t.integer :trial_period
      t.float   :price
      t.boolean :qr_enabled
      
      t.timestamps
    end
  end

  def self.down
    drop_table :subscription_levels
  end
end
