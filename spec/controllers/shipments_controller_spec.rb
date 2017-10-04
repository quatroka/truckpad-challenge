require 'rails_helper'

RSpec.describe ShipmentsController, type: :controller do
  let(:shipment) do
    {
      shipment: {
        value: 1500.0,
        weight_kg: 2000,
        contact: {
          name: 'Carlos', phone: '(11) 98765-4321'
        },
        vehicles: [
          { type: 'Truck', body_type: 'Baú' },
          { type: 'Truck', body_type: 'Sider' }
        ],
        origin: { city: 'São Paulo', state: 'SP', load_at: '2017-09-25' },
        destination: { city: 'Goiânia', state: 'GO', deliver_at: '2017-09-29' },
      }
    }
  end

  describe 'POST #create' do
    it 'a shipment' do
      post :create, params: shipment
      expect(response.status).to eq(201)
      expect(JSON.parse(response.body).keys[0]).to eq('Location')
    end
  end

  describe 'GET #shipment' do
    before { post :create, params: shipment }
    it 'by id' do
      get :shipment, params: { id: 1 }
      expect(response.status).to eq(200)
      expect(JSON.parse(response.body).keys[0]).to eq('value')
    end
  end

  describe 'GET #nearby_truckers' do
    before { post :create, params: shipment }
    it 'by shipment id' do
      get :nearby_truckers, params: { id: 1 }
      expect(response.status).to eq(200)
      expect(JSON.parse(response.body).keys[0]).to eq('truckers')
    end
  end
end
