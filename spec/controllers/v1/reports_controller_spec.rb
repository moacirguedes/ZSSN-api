require 'rails_helper'

RSpec.describe V1::ReportsController, type: :controller do
  let(:valid_attributes) do
    attributes_for(:report)
  end

  describe 'GET #index' do
    it 'returns a success response' do
      report = Report.create! valid_attributes
      get :index, params: { survivor_id: report.survivor_id }
      expect(assigns(:reports)).to eq([report])
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      report = Report.create! valid_attributes
      get :show, params: { survivor_id: report.survivor_id, id: report.to_param }
      expect(assigns(:report)).to eq(report)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Report of a infected survivor' do
        expect do
          report = valid_attributes
          post :create, params: { report: report, survivor_id: report[:survivor_id] }
        end.to change(Report, :count).by(1)
      end

      it 'renders a JSON response with the new report' do
        report = valid_attributes
        post :create, params: { report: report, survivor_id: report[:survivor_id] }
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json')
      end
    end

    it 'try to create a repeating report' do
      report = valid_attributes
      post :create, params: { report: report, survivor_id: report[:survivor_id] }
      post :create, params: { report: report, survivor_id: report[:survivor_id] }
      expect(response).to have_http_status(:unprocessable_entity)
      expect(response.content_type).to eq('application/json')
    end
  end

  describe 'GET #infected' do
    it 'returns http success' do
      get :infected
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET #non_infected' do
    it 'returns http success' do
      get :non_infected
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET #survivors_inventory' do
    it 'returns http success' do
      get :survivors_inventory
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET #points_lost' do
    it 'returns http success' do
      get :points_lost
      expect(response).to have_http_status(:ok)
    end
  end
end
