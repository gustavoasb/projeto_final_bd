class UfsController < ApplicationController
  before_action :set_uf, only: [:show, :update, :destroy]

  # GET /ufs
  def index
    @ufs = Uf.all

    render json: @ufs
  end

  # GET /ufs/1
  def show
    render json: @uf
  end

  # POST /ufs
  def create
    @uf = Uf.new(uf_params)

    if @uf.save
      render json: @uf, status: :created, location: @uf
    else
      render json: @uf.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /ufs/1
  def update
    if @uf.update(uf_params)
      render json: @uf
    else
      render json: @uf.errors, status: :unprocessable_entity
    end
  end

  # DELETE /ufs/1
  def destroy
    @uf.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_uf
      @uf = Uf.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def uf_params
      params.require(:uf).permit(:name)
    end
end
