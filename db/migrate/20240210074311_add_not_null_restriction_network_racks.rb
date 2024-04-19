class AddNotNullRestrictionNetworkRacks < ActiveRecord::Migration[7.1]
  def up
    change_column_null :network_racks, :name, false
    change_column_null :network_racks, :height, false
  end

  def down
    change_column_null :network_racks, :name, true
    change_column_null :network_racks, :height, true
  end
end
