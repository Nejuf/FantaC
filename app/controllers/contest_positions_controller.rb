class ContestPositionsController < ApplicationController
  before_action :set_contest_position, only: [:show, :edit, :update, :destroy]

  # GET /contest_positions
  # GET /contest_positions.json
  def index
    @contest_positions = ContestPosition.all
  end

  # GET /contest_positions/1
  # GET /contest_positions/1.json
  def show
  end

  # GET /contest_positions/new
  def new
    @contest_position = ContestPosition.new
  end

  # GET /contest_positions/1/edit
  def edit
  end

  # POST /contest_positions
  # POST /contest_positions.json
  def create
    @contest_position = ContestPosition.new(contest_position_params)

    respond_to do |format|
      if @contest_position.save
        format.html { redirect_to @contest_position, notice: 'Contest position was successfully created.' }
        format.json { render action: 'show', status: :created, location: @contest_position }
      else
        format.html { render action: 'new' }
        format.json { render json: @contest_position.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contest_positions/1
  # PATCH/PUT /contest_positions/1.json
  def update
    respond_to do |format|
      if @contest_position.update(contest_position_params)
        format.html { redirect_to @contest_position, notice: 'Contest position was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @contest_position.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contest_positions/1
  # DELETE /contest_positions/1.json
  def destroy
    @contest_position.destroy
    respond_to do |format|
      format.html { redirect_to contest_positions_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contest_position
      @contest_position = ContestPosition.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contest_position_params
      params[:contest_position]
    end
end
