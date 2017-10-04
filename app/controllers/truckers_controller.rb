class TruckersController < ApplicationController
  ##
  # Create a trucker
  def create
    create = create_trucker(create_params)
    if create.class != String
      render json: { Location: "/api/shipments/#{create}" },
             status: :created
    else
      render json: { error: "Missing parameters: #{create}" },
             status: :unprocessable_entity
    end
  end

  ##
  # Params to use on action *create*
  def last_location
    last = update_last_location(last_location_params)
    if last
      render status: :no_content
    else
      render json: { error: "Missing parameters: #{create}" },
            status: :unprocessable_entity
    end
  end

  private

  ##
  # Params to use on action *create*
  def create_params
    params.require(:trucker).permit(:name, :phone, vehicle: %i[type body_type])
  end

  ##
  # Create a trucker on system
  # +params+ -> Object of trucker attributes
  def create_trucker(params)
    %w[name phone vehicle].each do |k|
      return k unless params.key?(k)
    end
    Trucker.create(name: params[:name], phone: params[:phone],
                   vehicle_type: params[:vehicle][:type],
                   vehicle_body_type: params[:vehicle][:body_type])
    Trucker.last.id
  end

  ##
  # Params to use on action *last_location*
  def last_location_params
    params.require(:location).permit(:city, :state).merge(params.permit(:id))
  end

  ##
  # Update last location of a trucker
  # +params+ -> Object of trucker attributes
  def update_last_location(params)
    %w[id city state].each do |k|
      return k unless params.keys
    end
    Trucker.find(params[:id])
           .update(last_location_city: params[:city], 
                   last_location_state: params[:state])
    true
  end
end
