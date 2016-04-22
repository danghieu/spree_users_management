class AddUserIdToAddress < ActiveRecord::Migration
  def change
  	add_column :spree_addresses, :user_id, :integer
  	add_column :spree_addresses, :title, :string
  	add_foreign_key :spree_addresses, :spree_users, column: 'user_id'
  end
end
