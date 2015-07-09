class AddStatusToMatches < ActiveRecord::Migration
 def self.up
    add_column :matches, :status, :boolean
  end
 
  def self.down
    remove_column :matches, :status
  end
end
