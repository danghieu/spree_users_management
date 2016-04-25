module Spree
  module Api
    class UserImagesController < Spree::Api::BaseController
      skip_before_filter :verify_authenticity_token
      before_action :load_data

      def model_class
        Dish::UserImage
      end

      def create 
        @user_image = @user.images.build
        params[:user_image][:viewable_id]=@user.id
        set_viewable
        @user_image.attributes = permitted_resource_params
        if @user_image.save
          @status = [ { "messages" => "success"}]
          render "spree/api/logger/log",status: 200
        else
          @status = [ { "messages" => "fail"}]
          render "spree/api/logger/log",status: 400
        end
      end

      def update
        params[:user_image][:viewable_id]=@user.id
        @user_image =Dish::UserImage.find(params[:id])
        set_viewable
        @user_image.attributes = permitted_resource_params
        if @user_image.save
          @status = [ { "messages" => "success"}]
          render "spree/api/logger/log",status: 200
        else
          @status = [ { "messages" => "fail"}]
          render "spree/api/logger/log",status: 400
        end
      end

      private 
        def permitted_resource_params
          params[:user_image].present? ? params.require(:user_image).permit! : ActionController::Parameters.new
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