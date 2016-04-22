class CreateEmailSubscriptions < ActiveRecord::Migration
  def change
    create_table :email_subscriptions do |t|
    	t.string :email
    	t.boolean  :is_active, :default => true
      t.timestamps null: false
    end
  end
end
