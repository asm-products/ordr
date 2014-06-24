class ResearchesController < ApplicationController
  before_action :set_research, only: [:show, :edit, :update, :destroy]
  before_action :set_job

  # GET /researches
  # GET /researches.json
  def index
    @researches = Research.all
  end

  # GET /researches/1
  # GET /researches/1.json
  def show
  end

  # GET /researches/new
  def new
    @research = Research.new({job_id: @job.id })
  end

  # GET /researches/1/edit
  def edit
  end

  # POST /researches
  # POST /researches.json
  def create
    @research = @job.create_research(research_params)
    respond_to do |format|
      if @research.save
        format.html { redirect_to @job, notice: "Research was successfully created" }
        format.json { render :show, status: :created, location: @job }
      else
        format.html {render :new }
        format.json {render json: @research.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /researches/1
  # PATCH/PUT /researches/1.json
  def update
    respond_to do |format|
      if @research.update(research_params)
        format.html { redirect_to @job, notice: 'Research was successfully updated.' }
        format.json { render :show, status: :ok, location: @job }
      else
        format.html { render :edit }
        format.json { render json: @research.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /researches/1
  # DELETE /researches/1.json
  def destroy
    @research.destroy
    respond_to do |format|
      format.html { redirect_to researches_url, notice: 'Research was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

private
  # Use callbacks to share common setup or constraints between actions.
  def set_research
    @research = Research.find(params[:id])
  end

  def set_job
    @job = Job.find(params[:job_id])
  end
  # Never trust parameters from the scary internet, only allow the white list through.
  def research_params
    params.require(:research).permit(:values, :salary, :location, :notes)
  end
end
