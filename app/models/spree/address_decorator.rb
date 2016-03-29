Spree::Address.class_eval do
	clear_validators!
	#validates_presence_of :title
	belongs_to :user, :class_name => "Spree::User", foreign_key: "user_id"
	accepts_nested_attributes_for :user,
		                               :reject_if => :all_blank
end



