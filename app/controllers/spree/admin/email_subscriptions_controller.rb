module Spree
  module Admin
    class EmailSubscriptionsController < ResourceController
      before_action :load_data

      def model_class
        Dish::EmailSubscription
      end

      def show
        redirect_to action: :edit
      end

      def load_data
      end

      def location_after_save
        admin_email_subscriptions_url
      end

      def active
        @es = Dish::EmailSubscription.find(params[:id])
        if @es.is_active
          @es.is_active =false
        else
          @es.is_active =true
        end
        @es.save
        redirect_to  admin_email_subscriptions_url
      end

       def collection
        return @collection if @collection.present?
        params[:q] ||= {}
        params[:q][:deleted_at_null] ||= "1"

        params[:q][:s] ||= "email asc"
        @collection = super
        if params[:q].delete(:deleted_at_null) == '0'
          @collection = @collection.with_deleted
        end
        # @search needs to be defined as this is passed to search_form_for
        @search = @collection.ransack(params[:q])
        @collection = @search.result.
              page(params[:page]).
              per(params[:per_page] || Spree::Config[:admin_products_per_page])

        @collection
      end 

    end
  end
end