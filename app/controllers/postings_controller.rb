class PostingsController < ApplicationController
  def index
    indeed = Indeed.new(27713, "Ruby")
    @postings = indeed.fetch_one
  end

  def create
    # fetch data from one posting
    # create a job with that data
    # indeed = Job.new()
  end
end
