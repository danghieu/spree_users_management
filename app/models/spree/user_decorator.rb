Spree::User.class_eval do
	has_many :comments, :class_name => "Dish::Comment"
    has_many :products,
             :through => :comments
	has_many :addresses

    has_many :images, as: :viewable, dependent: :destroy, class_name: "Dish::UserImage"

    accepts_nested_attributes_for :comments,
             :reject_if => :all_blank,
             :allow_destroy => true

    accepts_nested_attributes_for :products,
             :reject_if => :all_blank,
             :allow_destroy => true

             
    accepts_nested_attributes_for :addresses,
             :reject_if => :all_blank,
             :allow_destroy => true
end
