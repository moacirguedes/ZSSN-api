module V1
  class ReportsController < ApplicationController
    before_action :set_survivor, only: :create

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
      @report.survivor = @survivor

      if !Survivor.exists?(@report.reporter_survivor_id)
        render json: { error: 'Reporter survivor does not exist' }, status: :not_found
      elsif @report.save
        infect if Report.count(@report.survivor_id) == 3
        render json: @report, status: :created, location: url_for([:v1, @survivor, @report])
      else
        render json: @report.errors, status: :unprocessable_entity
      end
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
