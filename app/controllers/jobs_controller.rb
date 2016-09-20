class JobsController < ApplicationController
  def index
    Job.all
  end

  def show
    Job.find(params[:id])
  end

  def new

  end

  def create
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
