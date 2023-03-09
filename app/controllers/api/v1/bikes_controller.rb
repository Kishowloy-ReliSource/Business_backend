class Api::V1::BikesController < ApplicationController
  before_action :set_bike, only: %i[ show update destroy ]

  # GET /bikes
  def index
    @bikes = Bike.all

    render json: @bikes
  end

  # GET /bikes/1
  def show
    render json: @bike
  end

  # POST /bikes
  def create
    result=Bike.create!( brand: params[:formValues][:bikeName], model: params[:formValues][:bikeModel], year: params[:formValues][:bikeYear], mileage: params[:formValues][:bikeMileage])
    render json:{text: 'saved'}, status: :created
  end

  # PATCH/PUT /bikes/1
  def update
    if @bike.update(bike_params)
      render json: @bike
    else
      render json: @bike.errors, status: :unprocessable_entity
    end
  end

  # DELETE /bikes/1
  def destroy
    @bike.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bike
      @bike = Bike.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def bike_params
      params.require(:bike).permit(:brand, :model, :year, :mileage)
    end
end
