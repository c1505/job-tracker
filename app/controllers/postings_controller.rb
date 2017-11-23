class PostingsController < ApplicationController
  def index
    posting = Posting.new
    if params[:search]
      @postings = posting.desired_postings(params[:search])
    else
      @postings = []
    end
    # indeed = Indeed.new(27713, "Ruby")
    # @postings = indeed.fetch_one

  end

  def create
    indeed = Indeed.new
    posting_id = params["id"]

    response = indeed.fetch_posting(posting_id)

    job_title = response["jobtitle"]
    url = "http://www.indeed.com/viewjob?jk=" + posting_id
    company = response["company"]
    location = response["formattedLocationFull"]

    job = Job.new(title: job_title, location: location, company: company, url: url)
    Posting.create(not_interested: posting_id)

    if job.save
      redirect_to edit_job_path(job)
      flash[:notice] = "Job successfully saved"
    else
      redirect_to postings_path
      flash[:notice] = "Error.  Job not saved"
    end
    # i don't know if create is the right name for this since it is create a job, but in a different way than normal crud
  end

  def not_interested
    posting_id = params["id"]
    Posting.create(not_interested: posting_id)
    redirect_to postings_path
    flash[:notice] = "Marked as not interested.  You will not see that posting again."
  end
end
