class BattleRostersController < ApplicationController
  load_and_authorize_resource
  before_action :set_battle_roster, only: [:show, :edit, :update, :destroy]

  # GET /battle_rosters
  # GET /battle_rosters.json
  def index
    @battle_rosters = BattleRoster.all
  end

  # GET /battle_rosters/1
  # GET /battle_rosters/1.json
  def show
  end

  # GET /battle_rosters/new
  def new
    @battle_roster = BattleRoster.new
  end

  # GET /battle_rosters/1/edit
  def edit
  end

  # POST /battle_rosters
  # POST /battle_rosters.json
  def create
    @battle_roster = BattleRoster.new(battle_roster_params)

    respond_to do |format|
      if @battle_roster.save
        format.html { redirect_to @battle_roster, notice: 'Battle roster was successfully created.' }
        format.json { render action: 'show', status: :created, location: @battle_roster }
      else
        format.html { render action: 'new' }
        format.json { render json: @battle_roster.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /battle_rosters/1
  # PATCH/PUT /battle_rosters/1.json
  def update
    respond_to do |format|
      if @battle_roster.update(battle_roster_params)
        format.html { redirect_to @battle_roster, notice: 'Battle roster was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @battle_roster.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /battle_rosters/1
  # DELETE /battle_rosters/1.json
  def destroy
    @battle_roster.destroy
    respond_to do |format|
      format.html { redirect_to battle_rosters_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_battle_roster
      @battle_roster = BattleRoster.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def battle_roster_params
      params[:battle_roster].permit(:battle_id, :character_id)
    end
end
