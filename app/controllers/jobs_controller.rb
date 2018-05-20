class JobsController < ApplicationController
  def index
    @jobs = Job.all
  end

  def show
    @job = Job.find(params[:id])
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
    if @job.save
      flash[:notice] = "Job successfully created"
      redirect_to @job
    else
      render '/new'
    end
  end

  def edit
    @job = Job.find(params[:id])
  end

  def update
    @job = Job.find(params[:id])
    if @job.update(job_params)
      flash[:notice] = "Job successfully updated"
      redirect_to edit_job_path(@job)
    else
      render '/new'
    end
  end

  def destroy
    @job = Job.find(params[:id])
    @job.destroy
    flash[:notice] = "Job successfully deleted"
    redirect_to jobs_path
  end




  private
    def job_params
      params.require(:job).permit(:location, :salary, :body, :interested,
      :contacted, :interview_date, :contacts, :company_info, :learn_technical,
      :build, :next_step, :title, :company, :user_id, :url )
    end
end
