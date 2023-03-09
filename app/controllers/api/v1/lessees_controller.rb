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

    Lessee.create!(lesseename: params[:formValues][:lesseeName], lesseeaddress: params[:formValues][:lesseeAddress], lesseephone: params[:formValues][:lesseePhone], lesseedob: params[:formValues][:lesseeDob], lesseemonthlyincome: params[:formValues][:lesseeMonthlyIncome],
    colesseename: params[:formValues][:coLesseeName], colesseeaddress: params[:formValues][:coLesseeAddress], colessephone: params[:formValues][:coLesseePhone], colesseedob: params[:formValues][:coLesseeDob], colesseemonthlyincome: params[:formValues][:coLesseeMonthlyIncome],
    downpayment: params[:formValues][:downPayment], bike_id: params[:formValues][:bike], approved:0
    )

    render json:{text: 'saved'},status: :created
  end

  # PATCH/PUT /lessees/1
  def update
    req= Lessee.find(params[:id])
    req.update!(approved: params[:apv])
    puts req.downpayment
    render json:{text: 'saved'},status: :ok
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
