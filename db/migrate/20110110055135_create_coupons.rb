class CreateCoupons < ActiveRecord::Migration
  def self.up
    create_table :coupons do |t|
      t.string :name
      t.string :terms
      t.string :barcode, :default => ""
      t.text :description, :default => ""
      t.integer :days_until_expiration, :default => 0
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :coupons
  end
end
