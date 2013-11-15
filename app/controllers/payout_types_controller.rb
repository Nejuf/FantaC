class PayoutTypesController < ApplicationController
  load_and_authorize_resource
  before_action :set_payout_type, only: [:show, :edit, :update, :destroy]

  # GET /payout_types
  # GET /payout_types.json
  def index
    @payout_types = PayoutType.all
  end

  # GET /payout_types/1
  # GET /payout_types/1.json
  def show
  end

  # GET /payout_types/new
  def new
    @payout_type = PayoutType.new
  end

  # GET /payout_types/1/edit
  def edit
  end

  # POST /payout_types
  # POST /payout_types.json
  def create
    @payout_type = PayoutType.new(payout_type_params)

    respond_to do |format|
      if @payout_type.save
        format.html { redirect_to @payout_type, notice: 'Payout type was successfully created.' }
        format.json { render action: 'show', status: :created, location: @payout_type }
      else
        format.html { render action: 'new' }
        format.json { render json: @payout_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /payout_types/1
  # PATCH/PUT /payout_types/1.json
  def update
    respond_to do |format|
      if @payout_type.update(payout_type_params)
        format.html { redirect_to @payout_type, notice: 'Payout type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @payout_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /payout_types/1
  # DELETE /payout_types/1.json
  def destroy
    @payout_type.destroy
    respond_to do |format|
      format.html { redirect_to payout_types_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_payout_type
      @payout_type = PayoutType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def payout_type_params
      params[:payout_type]
    end
end
