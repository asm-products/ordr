class JobsController < ApplicationController
  before_filter :check_authorization
  before_action :set_job, except: [:index, :new, :create]

  def index
    @jobs = Job.where(user: current_user)
  end

  def show

  end

  def new
    @job = Job.new(user: current_user)
  end

  def edit
  end

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

  def destroy
    @job.destroy
    respond_to do |format|
      format.html { redirect_to jobs_url, notice: 'Job was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def content
    render 'jobs/content_view', locals: {step: params[:step]}
  end

  def content_edit
    render 'jobs/content_edit', locals: {step: params[:step]}
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
