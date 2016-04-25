module Spree
  module Api
    class UserImagesController < Spree::Admin::ResourceController
      skip_before_filter :verify_authenticity_token
      before_action :load_data
      create.before :set_viewable
      update.before :set_viewable

      def model_class
        Dish::UserImage
      end

      def create 
        params[:user_image][:viewable_id]=@user.id
        invoke_callbacks(:create, :before)
        @object.attributes = permitted_resource_params
        if @object.save
          @status = [ { "messages" => "success"}]
          render "spree/api/logger/log",status: 200
        else
          @status = [ { "messages" => "fail"}]
          render "spree/api/logger/log",status: 400
        end
      end

      def update
        params[:user_image][:viewable_id]=@user.id
        invoke_callbacks(:update, :before)
        if @object.update_attributes(permitted_resource_params)
          @status = [ { "messages" => "success"}]
          render "spree/api/logger/log",status: 200
        else
          @status = [ { "messages" => "fail"}]
          render "spree/api/logger/log",status: 400
        end
      end

      private 

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