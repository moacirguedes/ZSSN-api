module Reportable
  extend ActiveSupport::Concern

  def infection_status
    if @survivor.infected
      render json: {
        error: 'This survivor is flagged as infected'
      }, status: :unprocessable_entity
    end
  end

  def percentage_infected
    ((Survivor.total_infected / Survivor.total_survivors) * 100).round(2)
  end

  def percentage_non_infected
    ((Survivor.total_non_infected / Survivor.total_survivors) * 100).round(2)
  end

  def items_average
    water_average = (Item.total_water / Survivor.total_survivors).round(2)
    food_average = (Item.total_food / Survivor.total_survivors).round(2)
    medication_average = (Item.total_medication / Survivor.total_survivors).round(2)
    ammunition_average = (Item.total_ammunition / Survivor.total_survivors).round(2)

    {
      water_per_survivor: water_average,
      food_per_survivor: food_average,
      medication_per_survivor: medication_average,
      ammunition_per_survivor: ammunition_average
    }
  end

  def check_reporter
    @reporter = Survivor.find(report_params[:reporter_survivor_id])

    if @reporter.infected
      render json: { error: 'This reporter is infected' }, status: :unprocessable_entity
    end
  end
end
