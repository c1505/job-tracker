class Posting < ActiveRecord::Base
  def desired_postings
    indeed = Indeed.new(27713, "Ruby")
    results = indeed.fetch_one["results"]
    results.delete_if do |result|
      Posting.find_by(not_interested: result["jobkey"])
    end
    results
  end
    # in here i should process incoming postings from indeed.
    # if they have been saved or indicated not interested, i don't want them to show up

    # could later even decide to purge this table every once in a while based on the date.
end
# i suppose it shouldn't be unordered though.  If I am finding something, I should start with the most recently added key.
# should probably just use serialize
