class AddNumbersToScores < ActiveRecord::Migration
  def change
    ##Add scoreing numbers
    add_column :scores, :num_20, :integer, :default => 0
    add_column :scores, :num_19, :integer, :default => 0
    add_column :scores, :num_18, :integer, :default => 0
    add_column :scores, :num_17, :integer, :default => 0
    add_column :scores, :num_16, :integer, :default => 0
    add_column :scores, :num_15, :integer, :default => 0
    add_column :scores, :num_bullseye, :integer, :default => 0

    ##add status
    add_column :scores, :status, :boolean, :default => 0

  end
end
