class DealersController < ApplicationController
  before_action :set_dealer, only: %i[ show update destroy ]

  # GET /dealers
  def index
    @dealers = Dealer.all

    render json: @dealers
  end

  # GET /dealers/1
  def show
    render json: @dealer
  end

  # POST /dealers
  def create
    @dealer = Dealer.new(dealer_params)

    if @dealer.save
      render json: @dealer, status: :created, location: @dealer
    else
      render json: @dealer.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /dealers/1
  def update
    if @dealer.update(dealer_params)
      render json: @dealer
    else
      render json: @dealer.errors, status: :unprocessable_entity
    end
  end

  # DELETE /dealers/1
  def destroy
    @dealer.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dealer
      @dealer = Dealer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def dealer_params
      params.require(:dealer).permit(:email, :name, :status, :dob, :pass)
    end
end
