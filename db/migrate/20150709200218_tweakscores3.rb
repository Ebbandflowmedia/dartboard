class Tweakscores3 < ActiveRecord::Migration
   def change
    remove_column :scores, :status_25
    remove_column :scores, :num_25

    add_column :scores, :status_25, :boolean, :default => 0
    add_column :scores, :num_25, :integer, :default => 0
  end
end
