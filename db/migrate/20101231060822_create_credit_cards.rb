class CreateCreditCards < ActiveRecord::Migration
  def self.up
    create_table :credit_cards do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :credit_cards
  end
end
