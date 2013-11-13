class CharactersController < ApplicationController
  before_action :set_character, only: [:show, :edit, :update, :destroy]

  # GET /characters
  # GET /characters.json
  def index
    aff_id = Affinity.getIDByName(params[:affinity])
    @affinity_name = ""
    if aff_id
      @characters = Character.where(affinity_id: aff_id)
      @affinity_name = params[:affinity].capitalize
    else
      @characters = Character.all
    end
  end

  # GET /characters/1
  # GET /characters/1.json
  def show
  end

  # GET /characters/new
  def new
    @character = Character.new
    @portrait = Portrait.new
  end

  # GET /characters/1/edit
  def edit
  end

  # POST /characters
  # POST /characters.json
  def create
    @character = Character.new(character_params)

    respond_to do |format|
      if @character.save

        @portrait = Portrait.new
        @portrait.character_id = @character.id
        @portrait.focusX = 0;
        @portrait.focusY = 0;
        @portrait.portrait_image = params[:character][:portrait_image]
        @portrait.save!

        format.html { redirect_to @portrait, notice: 'Character was successfully created.' }
        format.json { render action: 'show', status: :created, location: @character }
      else
        format.html { render action: 'new' }
        format.json { render json: @character.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /characters/1
  # PATCH/PUT /characters/1.json
  def update
    respond_to do |format|
      if @character.update(character_params)
        format.html { redirect_to @character, notice: 'Character was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @character.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /characters/1
  # DELETE /characters/1.json
  def destroy
    @character.destroy
    respond_to do |format|
      format.html { redirect_to characters_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_character
      @character = Character.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def character_params
      params[:character].permit(:name, :desc, :affinity_id, :tier_id, :stat_hp,
      :stat_str, :stat_def, :stat_spd, :stat_int, :stat_luck)
    end
end
