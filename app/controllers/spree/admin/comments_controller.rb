module Spree
  module Admin
    class CommentsController < ResourceController
      before_action :load_data
      #STATUS = [ "a", "b", "c" ]
      PENDING  = 0
      APPROVED = 1
      SPAM     = 2
      TRASH    = 3
      def model_class
        Dish::Comment
      end

      def index
        unless params[:filter].nil?
          @filter =params[:filter]  
        end
      end

      def is_integer?
        self.to_i.to_s == self
      end

      def show
        redirect_to action: :edit
      end

      def edit
        @status = Dish::Comment.find(params[:id]).status
      end

      def update_status
        if params[:comment][:status].present?
          comments = Dish::Comment.where(id: params[:comments])
          if comments.any?
            comments.each do |c|
              c.status = params[:comment][:status]
              c.save
            end
          end
        end
        respond_with(@comments) do |format|
          format.html { redirect_to location_after_save }
          format.js   { render layout: false }
        end
      end

      def load_data
        @status =[ "PENDING", "APPROVED", "SPAM", "TRASH" ]
        @filter="all"
      end

      def location_after_save
        admin_comments_url
      end

      def collection
        return @collection if @collection.present?
        params[:q] ||= {}
        params[:q][:deleted_at_null] ||= "1"

        params[:q][:s] ||= "created_at desc"
        @collection = super
        if params[:q].delete(:deleted_at_null) == '0'
          @collection = @collection.with_deleted
        end
        # @search needs to be defined as this is passed to search_form_for
        @search = @collection.ransack(params[:q])
        @collection = @search.result.
          page(params[:page]).
          per(params[:per_page] || Spree::Config[:admin_products_per_page])

        unless params[:filter].nil?
          if params[:filter] != 'all'
            @collection = @collection.where(status: params[:filter])
          end
        else
          @collection = @collection.where.not(status: TRASH)
        end
        @collection.order(created_at: :desc)
      end

    end
  end
end
