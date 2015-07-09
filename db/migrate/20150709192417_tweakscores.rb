class Tweakscores < ActiveRecord::Migration
  def change
    change_column :scores, :status_25, :integer, :default => 0
    change_column :scores, :num_25, :integer, :default => 0
  end
end
