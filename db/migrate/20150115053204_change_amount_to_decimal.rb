class ChangeAmountToDecimal < ActiveRecord::Migration
  def self.up
   change_column :transactions, :amount, :decimal

  end
  def self.down
    change_column :transactions, :amount, :integer
  end
end
