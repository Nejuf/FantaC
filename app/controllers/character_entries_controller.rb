class CharacterEntriesController < ApplicationController
  before_action :set_character_entry, only: [:show, :edit, :update, :destroy]

  # GET /character_entries
  # GET /character_entries.json
  def index
    @character_entries = CharacterEntry.all
  end

  # GET /character_entries/1
  # GET /character_entries/1.json
  def show
  end

  # GET /character_entries/new
  def new
    @character_entry = CharacterEntry.new
  end

  # GET /character_entries/1/edit
  def edit
  end

  # POST /character_entries
  # POST /character_entries.json
  def create
    @character_entry = CharacterEntry.new(character_entry_params)

    respond_to do |format|
      if @character_entry.save
        format.html { redirect_to @character_entry, notice: 'Character entry was successfully created.' }
        format.json { render action: 'show', status: :created, location: @character_entry }
      else
        format.html { render action: 'new' }
        format.json { render json: @character_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /character_entries/1
  # PATCH/PUT /character_entries/1.json
  def update
    respond_to do |format|
      if @character_entry.update(character_entry_params)
        format.html { redirect_to @character_entry, notice: 'Character entry was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @character_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /character_entries/1
  # DELETE /character_entries/1.json
  def destroy
    @character_entry.destroy
    respond_to do |format|
      format.html { redirect_to character_entries_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_character_entry
      @character_entry = CharacterEntry.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def character_entry_params
      params[:character_entry]
    end
end
