require 'rails_helper'

RSpec.describe V1::SurvivorsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/v1/survivors').to route_to('v1/survivors#index')
    end

    it 'routes to #show' do
      expect(get: '/v1/survivors/1').to route_to('v1/survivors#show', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/v1/survivors').to route_to('v1/survivors#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/v1/survivors/1').to route_to('v1/survivors#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/v1/survivors/1').to route_to('v1/survivors#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/v1/survivors/1').to route_to('v1/survivors#destroy', id: '1')
    end
  end
end
