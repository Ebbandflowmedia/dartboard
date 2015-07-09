class ChangeBullsEyeForScore < ActiveRecord::Migration
  def change
    remove_column :scores, :status_bullseye
    remove_column :scores, :num_bullseye

    add_column :scores, :status_25, :integer
    add_column :scores, :num_25, :integer
  end
end
