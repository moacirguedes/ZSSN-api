require 'rails_helper'

RSpec.describe V1::ItemsController, type: :controller do
  let(:valid_attributes) do
    attributes_for(:item)
  end

  describe 'GET #index' do
    it 'returns a success response' do
      item = Item.create! valid_attributes
      get :index, params: { survivor_id: item.survivor_id }
      expect(assigns(:items)).to eq([item])
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      item = Item.create! valid_attributes
      get :show, params: { survivor_id: item.survivor_id, id: item.to_param }
      expect(assigns(:item)).to eq(item)
    end
  end

  describe 'trade items' do
    skip('todo')
  end
end
