module Api
  module V1
    class ItemsController < ApplicationController
        include ActionController::Serialization


      before_action :set_item, only: [:show, :update, :destroy]

      # GET api/items
      def index
        @items = Item.all
        render json: @items, each_serializer: ItemV1Serializer
      end

      # GET api/items/:id
      def show
        render json: @item, serializer: ItemV1Serializer
      end

      # PUSH api/items/:id
      def create
        @item = Item.new(item_params)

        if @item.save
          render json: @item, adapter: :json, status: 201
        else
          render json: @item.errors, status: 422
        end
      end

      # PATCH/PUT /items/:id
      def update
        if @item.update(item_params)
          render json: @item
        else
          render json: @item.errors, status: :unprocessable_entity
        end
      end

      # DELETE /items/:id
      def destroy
        @item.destroy
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_item
          @item = Item.find(params[:id])
        end

        # Only allow a trusted parameter "white list" through.
        def item_params
          params.require(:item).permit(:name, :done, :todo_id)
        end
    end
  end
end