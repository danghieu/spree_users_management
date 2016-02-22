class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
    	t.string :body
    	t.integer :product_id
      	t.integer :user_id
    	t.integer :status
      t.timestamps null: false
    end
    add_foreign_key :comments, :spree_products, column: 'product_id'
    add_foreign_key :comments, :spree_users, column: 'user_id'
  end
end
