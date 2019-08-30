module V1
  class SurvivorsController < ApplicationController
    include Reportable

    before_action :set_survivor, only: %i[show update destroy]
    before_action :infection_status, only: %i[update destroy]

    def index
      @survivors = Survivor.all

      render json: @survivors
    end

    def show
      render json: @survivor
    end

    def create
      @survivor = Survivor.new(survivor_params)

      @survivor.item.each do |i|
        i.value = Item.items[i.name]
      end

      if @survivor.save
        render json: @survivor, include: :item, status: :created,
               location: url_for([:v1, @survivor])
      else
        render json: @survivor.errors, status: :unprocessable_entity
      end
    end

    def update
      if @survivor.update(survivor_params)
        render json: @survivor
      else
        render json: @survivor.errors, status: :unprocessable_entity
      end
    end

    def destroy
      @survivor.destroy
    end

    private

    def set_survivor
      @survivor = Survivor.find(params[:id])
    end

    def survivor_params
      params.require(:survivor).permit(
        :name, :age, :gender, :latitude,
        :longitude, item_attributes: [:name]
      )
    end
  end
end
