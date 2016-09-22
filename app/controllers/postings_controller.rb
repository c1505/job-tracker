class PostingsController < ApplicationController
  def index
    indeed = Indeed.new(27713, "Ruby")
    @postings = indeed.fetch_one
  end
end
