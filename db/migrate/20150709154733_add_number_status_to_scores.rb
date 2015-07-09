class AddNumberStatusToScores < ActiveRecord::Migration
  def change
    add_column :scores, :status_20, :boolean, :default => 0
    add_column :scores, :status_19, :boolean, :default => 0
    add_column :scores, :status_18, :boolean, :default => 0
    add_column :scores, :status_17, :boolean, :default => 0
    add_column :scores, :status_16, :boolean, :default => 0
    add_column :scores, :status_15, :boolean, :default => 0
    add_column :scores, :status_bullseye, :boolean, :default => 0

    #change deafults to 0
    change_column :scores, :hits, :integer, :default => 0
    change_column :scores, :shots, :integer, :default => 0
    change_column :scores, :score, :integer, :default => 0
  end
end
