class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string    :login
      t.string    :email
      t.string    :first_name
      t.string    :last_name
      t.string    :phone
      
      t.string    :crypted_password
      t.string    :password_salt
      t.string    :persistence_token

      t.integer   :login_count,         :null => false, :default => 0
      t.datetime  :current_login_at
      t.datetime  :last_login_at
      t.string    :current_login_ip
      t.string    :last_login_ip
      
      t.boolean   :admin, :default => false

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
