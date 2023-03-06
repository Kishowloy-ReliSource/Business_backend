class Api::V1::DealersController < ApplicationController
  before_action :set_dealer, only: %i[ show update destroy ]

  # GET /dealers
  def index
    @dealers = Dealer.all
    puts 'hi'
    render json: @dealers
  end

  # GET /dealers/1
  def show
    render json: @dealer
  end

  def login
    user= Dealer.find_by(email: params[:Email])
    # us=Admin.find_by(pass: params[:Password])
    puts params[:Email]
    if user && user.pass == params[:Password]
      render json:{bool: true}
    
    else
      render json:{bool: false}, status: :unauthorized
    end
  end

  # POST /dealers
  def create
    Dealer.create!(email: params[:email], pass: params[:password], status: params[:status], dob: params[:dob], name: params[:name], admin_id: session[:user_id])
    render json:{text: 'saved'}
    # @dealer = Dealer.new(dealer_params)

    # if @dealer.save
    #   render json: @dealer, status: :created, location: @dealer
    # else
    #   render json: @dealer.errors, status: :unprocessable_entity
    # end
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
