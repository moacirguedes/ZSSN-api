module V1
  class ReportsController < ApplicationController
    def index
      @reports = Report.all

      render json: @reports
    end

    def show
      @report = Report.find(params[:id])
      render json: @report
    end

    def create
      @report = Report.new(report_params)
      @report.survivor = Survivor.find(params[:survivor_id])

      Survivor.find(@report.reporter_survivor_id)

      if @report.save
        render json: @report, status: :created, location: url_for([:v1, @report.survivor, @report])
      else
        render json: @report.errors, status: :unprocessable_entity
      end
    end

    private

    def report_params
      params.require(:report).permit(:reporter_survivor_id)
    end
  end
end
