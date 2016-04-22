class ChangeDefaultCountryAndCity < ActiveRecord::Migration
  def change
  	change_column :spree_addresses, :state_id, :integer, default: 3708
  	change_column :spree_addresses, :country_id, :integer, default: 240

  end
end
