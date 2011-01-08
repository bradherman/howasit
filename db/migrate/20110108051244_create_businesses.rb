class CreateBusinesses < ActiveRecord::Migration
  def self.up
    create_table :businesses do |t|
      t.string  :name
      t.string  :phone
      t.string  :description
      t.integer :user_id
      t.integer :survey_id
      t.integer :coupon_id
      
      t.string  :street
      t.string  :city
      t.string  :state
      t.integer :zip
      t.string  :country, :default => "US"

      t.timestamps
    end
  end

  def self.down
    drop_table :businesses
  end
end
