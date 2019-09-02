require 'rails_helper'

RSpec.describe V1::SurvivorsController, type: :controller do
  let(:valid_attributes) do
    attributes_for(:survivor)
  end

  let(:invalid_attributes) do
    attributes_for(:invalid_survivor)
  end

  describe 'GET #index' do
    it 'returns a success response' do
      survivor = Survivor.create! valid_attributes
      get :index, params: {}
      expect(assigns(:survivors)).to eq([survivor])
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      survivor = Survivor.create! valid_attributes
      get :show, params: { id: survivor.to_param }
      expect(assigns(:survivor)).to eq(survivor)
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Survivor' do
        expect do
          post :create, params: { survivor: valid_attributes }
        end.to change(Survivor, :count).by(1)
      end

      it 'renders a JSON response with the new survivor' do
        post :create, params: { survivor: valid_attributes }
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json')
      end
    end

    context 'with invalid params' do
      it 'renders a JSON response with errors for the new survivor' do
        post :create, params: { survivor: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) do
        attributes_for(:survivor)
      end

      it 'updates the requested survivor' do
        survivor = Survivor.create! valid_attributes
        put :update, params: { id: survivor.to_param, survivor: new_attributes }
        survivor.reload
        expect(survivor.name).to eq(new_attributes[:name])
      end

      it 'renders a JSON response with the survivor' do
        survivor = Survivor.create! valid_attributes

        put :update, params: { id: survivor.to_param, survivor: valid_attributes }
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json')
      end
    end

    context 'with invalid params' do
      it 'renders a JSON response with errors for the survivor' do
        survivor = Survivor.create! valid_attributes

        put :update, params: { id: survivor.to_param, survivor: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested survivor' do
      survivor = Survivor.create! valid_attributes
      expect do
        delete :destroy, params: { id: survivor.to_param }
      end.to change(Survivor, :count).by(-1)
    end
  end
end
