module Infectable
  extend ActiveSupport::Concern

  def infection_status
    if @survivor.infected
      render json: {
        error: 'This survivor is flagged as infected'
      }, status: :unprocessable_entity
    end
  end
end
