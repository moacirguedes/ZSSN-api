module V1
  class ItemsController < ApplicationController
    include Reportable

    before_action :set_survivor, only: %i[index show]
    before_action :infection_status, only: %i[index show]
    before_action :set_survivors, only: :trade

    def index
      @items = Item.where(survivor_id: @survivor.id)

      render json: @items, except: :value
    end

    def show
      @item = Item.find_by(id: params[:id], survivor_id: @survivor.id)

      render json: @item, except: :value
    end

    def trade
      if trade_items
        render json: {
          data: 'Sucessfull trade'
        }, status: :ok
      else
        render json: {
          error: 'Can\'t trade, the items not have the same worth'
        }, status: :unprocessable_entity
      end
    end

    private

    def set_survivor
      @survivor = Survivor.find(params[:survivor_id])
    end

    def set_survivors
      @first_survivor = Survivor.find(params[:first_survivor])
      @second_survivor = Survivor.find(params[:second_survivor])
      check_survivors
    end

    def set_items
      @first_survivor_items = Item.where(
        survivor_id: @first_survivor.id,
        id: params[:first_survivor_items]
      )
      @second_survivor_items = Item.where(
        survivor_id: @second_survivor.id,
        id: params[:second_survivor_items]
      )
    end

    def trade_items
      set_items

      return false unless @first_survivor_items.any? || @second_survivor_items.any?

      if @first_survivor_items.sum(:value) == @second_survivor_items.sum(:value)
        @first_survivor_items.update_all(survivor_id: @second_survivor.id)
        @second_survivor_items.update_all(survivor_id: @first_survivor.id)
      end
    end
  end
end
