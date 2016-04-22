class AddIndexUniqueToEmailSubscription < ActiveRecord::Migration
  def change
  	add_index :email_subscriptions, :email, unique: true
  end
end
