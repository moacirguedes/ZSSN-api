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
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      item = Item.create! valid_attributes
      get :show, params: { survivor_id: item.survivor_id, id: item.to_param }
      expect(assigns(:item)).to eq(item)
      expect(response).to be_successful
    end
  end

  describe 'TRADE' do
    context 'with valid params' do
      it 'trade items' do
        item_one = create(:item, :water)
        item_two = create(:item, :water)

        survivor_one_id = item_one.survivor_id
        survivor_two_id = item_two.survivor_id

        post :trade, params: {
          first_survivor: survivor_one_id,
          second_survivor: survivor_two_id,
          first_survivor_items: [item_one.id],
          second_survivor_items: [item_two.id]
        }

        item_one.reload
        item_two.reload

        expect(item_one.survivor_id).to eq(survivor_two_id)
        expect(item_two.survivor_id).to eq(survivor_one_id)
      end
    end

    context 'with invalid params' do
      it 'do not trade items with differents worth' do
        item_one = create(:item, :water)
        item_two = create(:item, :food)

        survivor_one_id = item_one.survivor_id
        survivor_two_id = item_two.survivor_id

        post :trade, params: {
          first_survivor: survivor_one_id,
          second_survivor: survivor_two_id,
          first_survivor_items: [item_one.id],
          second_survivor_items: [item_two.id]
        }

        item_one.reload
        item_two.reload

        expect(item_one.survivor_id).to eq(survivor_one_id)
        expect(item_two.survivor_id).to eq(survivor_two_id)
      end

      it 'do not trade items from infected survivors' do
        item_one = create(:item, :water)
        item_two = create(:item, :water, :infected)

        survivor_one_id = item_one.survivor_id
        survivor_two_id = item_two.survivor_id

        post :trade, params: {
          first_survivor: survivor_one_id,
          second_survivor: survivor_two_id,
          first_survivor_items: [item_one.id],
          second_survivor_items: [item_two.id]
        }

        item_one.reload
        item_two.reload

        expect(item_one.survivor_id).to eq(survivor_one_id)
        expect(item_two.survivor_id).to eq(survivor_two_id)
      end
    end
  end
end
