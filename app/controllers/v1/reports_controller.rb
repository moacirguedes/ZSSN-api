module V1
  class ReportsController < ApplicationController
    include Reportable

    before_action :set_survivor, only: %i[index show create]
    before_action :infection_status, only: :create
    before_action :check_reporter, only: :create

    def index
      @reports = Report.where(survivor_id: @survivor.id)

      render json: @reports
    end

    def show
      @report = Report.find_by(id: params[:id], survivor_id: @survivor.id)

      render json: @report
    end

    def create
      @report = Report.new(report_params)
      @report.survivor = @survivor

      if @report.save
        infect if Report.where(survivor_id: @report.survivor_id).count == 3
        render json: @report, status: :created, location: url_for([:v1, @survivor, @report])
      else
        render json: @report.errors, status: :unprocessable_entity
      end
    end

    def infected
      render json: {
        data: "#{percentage_infected}% of the survivors are infected"
      }, status: :ok
    end

    def non_infected
      render json: {
        data: "#{percentage_non_infected}% of the survivors aren't infected"
      }, status: :ok
    end

    def survivors_inventory
      render json: { data: items_average }, status: :ok
    end

    def points_lost
      render json: {
        data: "#{Item.points_lost} points lost to infected survivors"
      }, status: :ok
    end

    private

    def set_survivor
      @survivor = Survivor.find(params[:survivor_id])
    end

    def report_params
      params.require(:report).permit(:reporter_survivor_id)
    end

    def infect
      @survivor.update_attribute(:infected, true)
    end
  end
end
