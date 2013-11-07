class AffinitiesController < ApplicationController
  before_action :set_affinity, only: [:show, :edit, :update, :destroy]

  # GET /affinities
  # GET /affinities.json
  def index
    @affinities = Affinity.all
  end

  # GET /affinities/1
  # GET /affinities/1.json
  def show
  end

  # GET /affinities/new
  def new
    @affinity = Affinity.new
  end

  # GET /affinities/1/edit
  def edit
  end

  # POST /affinities
  # POST /affinities.json
  def create
    @affinity = Affinity.new(affinity_params)

    respond_to do |format|
      if @affinity.save
        format.html { redirect_to @affinity, notice: 'Affinity was successfully created.' }
        format.json { render action: 'show', status: :created, location: @affinity }
      else
        format.html { render action: 'new' }
        format.json { render json: @affinity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /affinities/1
  # PATCH/PUT /affinities/1.json
  def update
    respond_to do |format|
      if @affinity.update(affinity_params)
        format.html { redirect_to @affinity, notice: 'Affinity was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @affinity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /affinities/1
  # DELETE /affinities/1.json
  def destroy
    @affinity.destroy
    respond_to do |format|
      format.html { redirect_to affinities_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_affinity
      @affinity = Affinity.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def affinity_params
      params[:affinity]
    end
end
