module Spree
  module Admin
    class UserImagesController < ResourceController
       before_action :load_data

      create.before :set_viewable
      update.before :set_viewable

      def model_class
        Dish::UserImage
      end

      def show
        redirect_to action: :edit
      end

      def new
        @user_image = @user.images.build
      end

      private 
        def location_after_destroy
          admin_user(@user)
        end

        def location_after_save
          edit_admin_user_user_image_url(@user,@user.images.first)
        end

        def load_data
          @user = Spree::User.find(params[:user_id])
        end

        def set_viewable
          @user_image.viewable_type = 'Spree::User'
          @user_image.viewable_id = params[:user_image][:viewable_id]
        end
    end
  end
end