class Api::V1::AdminsController < ApplicationController
  before_action :set_admin, only: %i[ show update destroy ]

  # GET /admins
  def index
    @admins = Admin.all
    puts session[:user_id]
    render json: @admins
  end

  # GET /admins/1
  def show
    render json: @admin
  end

  def login
    puts params[:formValues][:email]
    user= Admin.find_by(email: params[:formValues][:email])
    puts params[:formValues][:email]
    if user && user.pass == params[:formValues][:password]
      session[:user_id]= user.id
      render json:{bool: true}, status: :ok
    else
      render json: {bool: false},status: :unauthorized
    end
  end

  # POST /admins
  def create
    @admin = Admin.new(admin_params)

    if @admin.save
      render json: @admin, status: :created, location: @admin
    else
      render json: @admin.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /admins/1
  def update
    if @admin.update(admin_params)
      render json: @admin
    else
      render json: @admin.errors, status: :unprocessable_entity
    end
  end

  # DELETE /admins/1
  def destroy
    @admin.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin
      @admin = Admin.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def admin_params
      params.require(:admin).permit(:email, :pass)
    end
end
