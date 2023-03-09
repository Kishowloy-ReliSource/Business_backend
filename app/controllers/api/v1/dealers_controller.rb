class Api::V1::DealersController < ApplicationController
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

  def login
    user= Dealer.find_by(email: params[:formValues][:email])
    puts params[:formValues][:email]
    if user && user.pass == params[:formValues][:password]
      render json:{bool: true}, status: :ok
    
    else
      render json:{bool: false}, status: :unauthorized
    end
  end

  # POST /dealers
  def create
    user = Dealer.where(email: params[:formValues][:email])
    if user.length()>0
      render json:{text:'This email exsist '},status: :not_acceptable
    else
      Dealer.create!(email: params[:formValues][:email], pass: params[:formValues][:password], status: params[:formValues][:status], dob: params[:formValues][:dob], name: params[:formValues][:name], admin_id: session[:user_id])
      render json:{text: 'saved'},status: :created
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
