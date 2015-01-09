class DropBalanceFromAccounts < ActiveRecord::Migration
   def self.up
    change_table :accounts do |t|
      t.remove :balance
    end

  end
  def self.down
    change_table :accounts do |t|
      t.integer :balance
    end
  end
end
