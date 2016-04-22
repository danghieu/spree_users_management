class ChangeCityDefaultInAddresses < ActiveRecord::Migration
  def change
  	change_column :spree_addresses, :state_id, :integer, default: 11260
  end
end
