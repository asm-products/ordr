
class JobsController < ApplicationController
  before_filter :check_authorization
  before_action :set_job, except: [:index, :new, :create]

  # GET /jobs
  # GET /jobs.json
  def index
    @jobs = Job.where(user: current_user)
  end

  # GET /jobs/1
  # GET /jobs/1.json
  def show
    @contactable = @job
    @contacts = @job.contacts

    @research = @job.research
    @networks = @job.networks
    @resume = @job.resume
    @job_application = @job.job_application
    @interviews = @job.interviews
  end

  # GET /jobs/new
  def new
    @job = Job.new(user: current_user)
  end

  # GET /jobs/1/edit
  def edit
  end

  # POST /jobs
  # POST /jobs.json
  def create
    @job = Job.new(job_params)
    @job.user = current_user
    respond_to do |format|
      if @job.save
        format.html { redirect_to @job, notice: 'Job was successfully created.' }
        format.json { render :show, status: :created, location: @job }
      else
        format.html { render :new }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /jobs/1
  # PATCH/PUT /jobs/1.json
  def update
    respond_to do |format|
      if @job.update(job_params)
        format.html { redirect_to @job, notice: 'Job was successfully updated.' }
        format.json { render :show, status: :ok, location: @job }
      else
        format.html { render :edit }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jobs/1
  # DELETE /jobs/1.json
  def destroy
    @job.destroy
    respond_to do |format|
      format.html { redirect_to jobs_url, notice: 'Job was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def research
    render 'jobs/research_view', locals: {research: @job.research}
  end

  def network
    render 'jobs/network_view', locals: {networks: @job.networks}
  end

private
  # Use callbacks to share common setup or constraints between actions.
  def set_job
    @job = Job.find(params[:id])
  end

  def job_params
    params.require(:job).permit!
  end

  def check_authorization
    @job ? authorize(@job.user) : authorize()
  end
end
