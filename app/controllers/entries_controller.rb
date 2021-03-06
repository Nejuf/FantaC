class EntriesController < ApplicationController
  load_and_authorize_resource
  before_action :set_entry, only: [:show, :edit, :update, :destroy]

  # GET /entries
  # GET /entries.json
  def index
    @entries = Entry.includes(:contest).all
  end

  # GET /entries/1
  # GET /entries/1.json
  def show
  end

  # GET /entries/new
  def new
    params[:contest_id] ||= Battle.featured.main_contest.id
    @contest = Contest.find(params[:contest_id])
    prev_entry = Entry.find_by(user_id: current_user.id, contest_id: @contest.id)
    if prev_entry
      redirect_to edit_entry_url(prev_entry), notice: "You already have an entry for this contest.  Edit it here."
    else
      @entry = Entry.new(params[:entry])
      render :new
    end
  end

  # GET /entries/1/edit
  def edit
  end

  # POST /entries
  # POST /entries.json
  def create
    @entry = Entry.new(entry_params)
    @entry.user_id = current_user.id

    respond_to do |format|
      if @entry.save
        format.html { redirect_to @entry, notice: 'Entry was successfully created.' }
        format.json { render action: 'show', status: :created, location: @entry }
      else
        flash[:error] = @entry.errors.full_messages
        format.html{ redirect_to new_entry_url }
        format.json { render json: @entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /entries/1
  # PATCH/PUT /entries/1.json
  def update
    respond_to do |format|
      if @entry.update(entry_params)
        format.html { redirect_to @entry, notice: 'Entry was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /entries/1
  # DELETE /entries/1.json
  def destroy
    @entry.destroy
    respond_to do |format|
      format.html { redirect_to entries_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_entry
      @entry = Entry.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def entry_params
      params[:entry].permit(:name, :desc, :contest_id)
    end
end
