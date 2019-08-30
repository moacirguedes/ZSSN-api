module V1
  class ItemsController < ApplicationController
    def index
      @items = Item.all

      render json: @items
    end

    def show
      @item = Item.find(params[:id])
      render json: @item
    end

    def create
      @item = Item.new(item_params)
      @item.survivor = Survivor.find(params[:survivor_id])
      @item.value = Item.items[@item.name]

      if @item.save
        render json: @item, status: :created, location: url_for([:v1, @item.survivor, @item])
      else
        render json: @item.errors, status: :unprocessable_entity
      end
    end

    private

    def item_params
      params.require(:item).permit(:name)
    end
  end
end
