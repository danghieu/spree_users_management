class AddTitleToComment < ActiveRecord::Migration
  def change
  	add_column :comments, :title, :string
  	change_column :comments, :status, :integer, default: 0
  end
end
