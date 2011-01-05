class CreateBillingInfos < ActiveRecord::Migration
  def self.up
    create_table :billing_infos do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :billing_infos
  end
end
