class UsersHaveAndBelongToManyMatches < ActiveRecord::Migration
 def self.up
    create_table :matches_users, :id => false do |t|
      t.references :match, :user
    end
  end
 
  def self.down
    drop_table :matches_users
  end
end
