class PlantsController < ApplicationController # rubocop:disable Style/Documentation
  wrap_parameters format: []

  # GET /plants
  def index
    plant = Plant.all
    render json: plant
  end

  # GET /plants/:id
  def show
    plant = Plant.find_by(id: params[:id])
    if plant
      render json: plant
    else
      render json: { error: "plant not found" }, status: :not_found
    end
  end

  # POST /plants/create
  def create
    plant = Plant.create(plant_params)
    render json: plant, status: :created
  end

  private

  # all methods down here are private, again convention over configuration.
  # defining our strong params to restrict access to all our attributes by a user or client side.
  def plant_params
    params.permit(:name, :image, :price)
  end

end
