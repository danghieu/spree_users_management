module Dish
	class EmailSubscription < Spree::Base
		validates_uniqueness_of :email
    validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
	end
end
