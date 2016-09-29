class PostingsController < ApplicationController
  def index
    posting = Posting.new
    @postings = posting.desired_postings
    # indeed = Indeed.new(27713, "Ruby")
    # @postings = indeed.fetch_one

  end

  def create
    indeed = Indeed.new
    posting_id = params["id"]
    response = indeed.fetch_posting(posting_id)
    job_title = response["response"]["results"]["result"]["jobtitle"] #likely move this to indeed
    job = Job.new(title: job_title)
    Posting.create(not_interested: posting_id)
    if job.save
      redirect_to postings_path
      flash[:notice] = "Job successfully saved"
    else
      redirect_to postings_path
      flash[:notice] = "Error.  Job not saved"
    end
    # fetch data from one posting
    # create a job with that data
    # indeed = Job.new()
  end
end
