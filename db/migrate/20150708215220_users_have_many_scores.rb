class UsersHaveManyScores < ActiveRecord::Migration
  def self.up
    change_table :scores, :id => false do |t|
      t.belongs_to :match, index:true
      t.belongs_to :user, index:true
      t.integer :hits
      t.integer :shots
      t.integer :score
    end
  end
 
  def self.down
    remove_column :scores, :match
    remove_column :scores, :user
    remove_column :scores, :hits
    remove_column :scores, :shots
    remove_column :scores, :score
  end
end
