require 'rails_helper'

RSpec.describe TruckersController, type: :controller do
  let(:trucker) do
    {
      trucker: {
        name: 'Lincoln Falcão',
        phone: '(11) 97654-3210',
        vehicle: {
          type: 'Truck', body_type: 'Baú'
        }
      }
    }
  end

  describe 'GET #create' do
    it 'a trucker ' do
      post :create, params: trucker
      expect(response.status).to eq(201)
      expect(JSON.parse(response.body).keys[0]).to eq('Location')
    end
  end

  describe 'PUT #last_location' do
    it 'of trucker' do
      
    end
  end
end
