class Api::V1::LesseesController < ApplicationController
  before_action :set_lessee, only: %i[ show update destroy ]

  # GET /lessees
  def index
    @lessees = Lessee.all

    render json: @lessees
  end

  # GET /lessees/1
  def show
    render json: @lessee
  end

  # POST /lessees
  def create

    Lessee.create!(lesseename: params[:lesseeName], lesseeaddress: params[:lesseeAddress], lesseephone: params[:lesseePhone], lesseedob: params[:lesseeDob], lesseemonthlyincome: params[:lesseeMonthlyIncome],
    colesseename: params[:coLesseeName], colesseeaddress: params[:coLesseeAddress], colessephone: params[:coLesseePhone], colesseedob: params[:coLesseeDob], colesseemonthlyincome: params[:coLesseeMonthlyIncome],
    downpayment: params[:downPayment], bike_id: params[:bike], approved:0
    )

    render json:{text: 'saved'}

    # @lessee = Lessee.new(lessee_params)

    # if @lessee.save
    #   render json: @lessee, status: :created, location: @lessee
    # else
    #   render json: @lessee.errors, status: :unprocessable_entity
    # end
  end

  # PATCH/PUT /lessees/1
  def update
    req= Lessee.find(params[:id])
    req.update!(approved: params[:apv])
    puts req.downpayment
    render json:{text: 'saved'}
    # if @lessee.update(lessee_params)
    #   render json: @lessee
    # else
    #   render json: @lessee.errors, status: :unprocessable_entity
    # end
  end

  # DELETE /lessees/1
  def destroy
    @lessee.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lessee
      @lessee = Lessee.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def lessee_params
      params.require(:lessee).permit(:lesseename, :lesseeaddress, :lesseephone, :lesseemonthlyincome, :lesseedob, :colesseename, :colesseeaddress, :colessephone, :colesseemonthlyincome, :colesseedob, :downpayment, :bike_id)
    end
end
