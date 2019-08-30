module V1
  class ItemsController < ApplicationController
    include Reportable

    before_action :set_survivor, only: %i[index show]
    before_action :infection_status, only: %i[index show]

    def index
      @items = Item.where(survivor_id: @survivor.id)

      render json: @items
    end

    def show
      @item = Item.find_by(id: params[:id], survivor_id: @survivor.id)

      render json: @item
    end

    def trade
    end

    private

    def set_survivor
      @survivor = Survivor.find(params[:survivor_id])
    end
  end
end
