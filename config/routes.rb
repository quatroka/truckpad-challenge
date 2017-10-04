Rails.application.routes.draw do
  post '/api/shipments',                     to: 'shipments#create',          as: 'shipments_create'
  get  '/api/shipments/:id',                 to: 'shipments#shipment',        as: 'shipments'
  post '/api/truckers',                      to: 'truckers#create',           as: 'truckers_create'
  put  '/api/truckers/:id/last_location',    to: 'truckers#last_location',    as: 'truckers_last_location'
  get  '/api/shipments/:id/nearby_truckers', to: 'shipments#nearby_truckers', as: 'shipments_nearby_truckers'
end
