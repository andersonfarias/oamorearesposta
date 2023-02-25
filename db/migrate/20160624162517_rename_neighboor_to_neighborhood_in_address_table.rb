class RenameNeighboorToNeighborhoodInAddressTable < ActiveRecord::Migration[4.2]
  def change
    rename_column :addresses, :neighboor, :neighborhood
  end
end
