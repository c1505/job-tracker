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

  end

  def update

  end


  private
    def job_params
      params.require(:job).permit(:location, :salary, :body, :interested,
      :contacted, :interview_date, :contacts, :company_info, :learn_technical,
      :build, :next_step, :title, :company, :user_id )
    end
end
