require 'rails_helper'

RSpec.describe V1::ItemsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/v1/survivors/1/items').to route_to('v1/items#index', survivor_id: '1')
    end

    it 'routes to #show' do
      expect(get: '/v1/survivors/1/items/1').to route_to('v1/items#show', id: '1', survivor_id: '1')
    end

    it 'routes to #trade' do
      expect(post: '/v1/items/trade').to route_to('v1/items#trade')
    end
  end
end
