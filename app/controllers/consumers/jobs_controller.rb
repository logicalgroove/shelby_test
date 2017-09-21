class Consumers::JobsController < ApplicationController
  before_action :restrict_service_providers
  before_action :set_job, only: [:show, :edit, :update, :destroy]

  def index
    @jobs = current_user.jobs
  end

  def show
  end

  def new
    @job = current_user.jobs.new
  end

  def create
    @job = current_user.jobs.new(job_params)
    if @job.save
      redirect_to consumers_job_path(@job)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @job.update(job_params)
      redirect_to consumers_job_path(@job)
    else
      render :edit
    end
  end

  def destroy
    redirect_to consumers_jobs_path if @job.destroy
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :price)
  end

  def set_job
    @job = current_user.jobs.find(params[:id])
  end
end
