class Addcurrentshootertomatch < ActiveRecord::Migration
  def change
    add_column :matches, :shooter_id, :string
  end
end
