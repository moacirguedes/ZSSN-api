module V1
  class SurvivorsController < ApplicationController
    before_action :set_survivor, only: %i[show update destroy]

    # GET /survivors
    def index
      @survivors = Survivor.all

      render json: @survivors
    end

    # GET /survivors/1
    def show
      render json: @survivor
    end

    # POST /survivors
    def create
      @survivor = Survivor.new(survivor_params)

      if @survivor.save
        render json: @survivor, status: :created, location: url_for([:v1, @survivor])
      else
        render json: @survivor.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /survivors/1
    def update
      if @survivor.update(survivor_params)
        render json: @survivor
      else
        render json: @survivor.errors, status: :unprocessable_entity
      end
    end

    # DELETE /survivors/1
    def destroy
      @survivor.destroy
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_survivor
      @survivor = Survivor.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def survivor_params
      params.require(:survivor).permit(:name, :age, :gender, :latitude, :longitude)
    end
  end
end
