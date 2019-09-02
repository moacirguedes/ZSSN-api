require 'rails_helper'

RSpec.describe V1::ReportsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/v1/survivors/1/reports').to route_to('v1/reports#index', survivor_id: '1')
    end

    it 'routes to #show' do
      expect(get: '/v1/survivors/1/reports/1').to route_to('v1/reports#show', id: '1', survivor_id: '1')
    end

    it 'routes to #create' do
      expect(post: '/v1/survivors/1/reports').to route_to('v1/reports#create', survivor_id: '1')
    end

    it 'routes to #infected' do
      expect(get: '/v1/reports/infected').to route_to('v1/reports#infected')
    end

    it 'routes to #non_infected' do
      expect(get: '/v1/reports/non_infected').to route_to('v1/reports#non_infected')
    end

    it 'routes to #survivors_inventory' do
      expect(get: '/v1/reports/survivors_inventory').to route_to('v1/reports#survivors_inventory')
    end

    it 'routes to #points_lost' do
      expect(get: '/v1/reports/points_lost').to route_to('v1/reports#points_lost')
    end
  end
end
