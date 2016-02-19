class AddIsActiveToSpreeUser < ActiveRecord::Migration
  def change
  	 add_column :spree_users,  :is_active, :boolean, :default => true
  end
end
