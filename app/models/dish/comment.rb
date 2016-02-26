module Dish
	class Comment < Spree::Base
		belongs_to :product, :class_name => "Spree::Product", foreign_key: "product_id"
		belongs_to :user, :class_name => "Spree::User", foreign_key: "user_id"

		accepts_nested_attributes_for :product,
		                               :reject_if => :all_blank
		accepts_nested_attributes_for :user,
		                               :reject_if => :all_blank
	end
end
