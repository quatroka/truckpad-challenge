class ShipmentsController < ApplicationController
  def create
    create = create_shipment(create_params)
    if create.class != String
      render json: { Location: '/api/shipments/#{create}' },
             status: :created
    else
      render json: { error: 'Missing parameters: #{create}' },
             status: :unprocessable_entity
    end
  end

  def shipment
    id = shipment_params[:id].to_i
    begin
      result = Shipment.find(id)
      vehicles = ShipmentVehicle.where(shipment_id: id)
                                .map do |x|
                                  { type: x[:vehicle_type],
                                    body_type: x[:vehicle_body_type] }
                                end
      json = { value: result[:value], weight_kg: result[:weight_kg],
               contact: { name: result[:contact_name],
                          phone: result[:contact_phone] },
               vehicles: vehicles,
               origin: { city: result[:origin_city],
                         state: result[:origin_state],
                         load_at: result[:origin_load_at] },
               destination: { city: result[:destination_city],
                              state: result[:destination_state],
                              load_at: result[:destination_deliver_at] } }
      render json: json, status: :ok
    rescue
      render json: { error: 'Can\'t find id: #{id}' },
             status: :unprocessable_entity
    end
  end

  def nearby_truckers
    id = nearby_truckers_params[:id].to_i
    begin
      city = Shipment.find(id).origin_city
      truckers = Trucker.where(last_location_city: city)
      json = { truckers: truckers.map do |t|
                           { id: t[:id],
                             name: t[:name],
                             phone: t[:phone],
                             vehicle: { type: t[:vehicle_type],
                                        body_type: t[:vehicle_body_type] } }
                         end }
      render json: json,
             status: :ok
    rescue
      render json: { error: 'Can\'t find id: #{id}' },
             status: :unprocessable_entity
    end
  end

  private

  def create_params
    params.require(:shipment).permit(:value, :weight_kg,
                                     contact: %i[name phone],
                                     vehicles: %i[type body_type],
                                     origin: %i[city state load_at],
                                     destination: %i[city state deliver_at])
  end

  def create_shipment(params)
    %w[value weight_kg contact vehicles origin destination].each do |k|
      return k unless params.key?(k)
    end

    Shipment.create(value: params[:value], weight_kg: params[:weight_kg],
                    contact_name: params[:contact][:name],
                    contact_phone: params[:contact][:phone],
                    origin_city: params[:origin][:city],
                    origin_state: params[:origin][:state],
                    origin_load_at: params[:origin][:load_at],
                    destination_city: params[:destination][:city],
                    destination_state: params[:destination][:state],
                    destination_deliver_at: params[:destination][:deliver_at])
    params[:vehicles].each do |v|
      ShipmentVehicle.create(vehicle_type: v[:type],
                             vehicle_body_type: v[:body_type],
                             shipment_id: Shipment.last.id)
    end
    Shipment.last.id
  end

  def shipment_params
    params.permit(:id)
  end

  def nearby_truckers_params
    params.permit(:id)
  end
end
