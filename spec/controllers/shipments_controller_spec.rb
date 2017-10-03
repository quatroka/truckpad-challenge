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
      get :shipment, params: { id: 1 }
      post :create, params: shipment
      expect(response.status).to eq(201)
      expect(JSON.parse(response.body).keys[0]).to eq('Location')
    end
  end
end
