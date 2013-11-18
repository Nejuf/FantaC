class BattlesController < ApplicationController
  load_and_authorize_resource
  before_action :set_battle, only: [:show, :edit, :update, :destroy]

  # GET /battles
  # GET /battles.json
  def index
    @battles = Battle.all
  end

  # GET /battles/1
  # GET /battles/1.json
  def show
  end

  # GET /battles/new
  def new
    @battle = Battle.new
  end

  # GET /battles/1/edit
  def edit
  end

  # POST /battles
  # POST /battles.json
  def create
    @battle = Battle.new(battle_params)
    @battle.user_id = current_user.id
    @battle.start_date = Time.now.utc
    date_end = Chronic.parse(params[:battle][:end_date])
    @battle.end_date = date_end.nil? ? nil : date_end.utc.to_s
    debugger
    if params[:character_ids]
      char_ids = params[:character_ids]
      char_ids.shift
    end
    if char_ids.nil? || (char_ids.length < 2)
      @battle.errors.add(:battle_rosters, "A battle must have at least two characters.")
    end
    respond_to do |format|
      if @battle.errors.empty? && @battle.save
        char_ids.each do |char_id|
          @battle.battle_rosters.create(character_id: char_id.to_i)
        end
        format.html { redirect_to @battle, notice: 'Battle was successfully created.' }
        format.json { render action: 'show', status: :created, location: @battle }
      else
        flash[:error] = @battle.errors.full_messages
        format.html { render action: 'new' }
        format.json { render json: @battle.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /battles/1
  # PATCH/PUT /battles/1.json
  def update
    respond_to do |format|
      if @battle.update(battle_params)
        format.html { redirect_to @battle, notice: 'Battle was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @battle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /battles/1
  # DELETE /battles/1.json
  def destroy
    @battle.destroy
    respond_to do |format|
      format.html { redirect_to battles_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_battle
      @battle = Battle.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def battle_params
      params[:battle].permit(:name, :desc, :end_date)
    end
end
