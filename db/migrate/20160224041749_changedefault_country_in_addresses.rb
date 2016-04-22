class ChangedefaultCountryInAddresses < ActiveRecord::Migration
  def change
  	change_column :spree_addresses, :country_id, :integer, default: 488
  end
end
