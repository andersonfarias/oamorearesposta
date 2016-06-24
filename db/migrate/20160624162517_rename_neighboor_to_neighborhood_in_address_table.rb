class RenameNeighboorToNeighborhoodInAddressTable < ActiveRecord::Migration
  def change
    rename_column :addresses, :neighboor, :neighborhood
  end
end
