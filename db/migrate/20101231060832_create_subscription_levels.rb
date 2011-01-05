class CreateSubscriptionLevels < ActiveRecord::Migration
  def self.up
    create_table :subscription_levels do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :subscription_levels
  end
end
