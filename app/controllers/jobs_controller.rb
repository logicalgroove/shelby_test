class JobsController < ApplicationController
  before_action :restrict_consumers
  before_action :set_job, only: [:accept, :cancel]

  def index
    @jobs = Job.where(provider_id: nil)
  end

  def accepted
    @jobs = current_user.jobs
    render :index
  end

  def accept
    @job.accept!(current_user) and redirect_to accepted_jobs_path
  end

  def cancel
    @job.cancel!(current_user) and redirect_to accepted_jobs_path
  end

  private

  def set_job
    @job = Job.find(params[:id])
  end
end
