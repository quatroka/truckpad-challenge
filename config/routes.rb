Rails.application.routes.draw do
  post '/api/shipments',     to: 'shipments#create',   as: 'shipment_create'
  get  '/api/shipments/:id', to: 'shipments#shipment', as: 'shipment'
end
