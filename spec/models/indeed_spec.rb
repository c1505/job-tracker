require 'rails_helper'

RSpec.describe Indeed do
  describe "indeed" do
    it "has a class" do
      zip_code = 27713
      query = "Ruby"
      indeed = Indeed.new(zip_code, query)
      expect(indeed).to be_instance_of(Indeed)
    end
    it "has a successful request" do
      zip_code = 27713
      query = "Ruby"
      indeed = Indeed.new(zip_code, query)
      response = indeed.fetch_one
      expect(response.code).to be 200
    end

    it "can fetch all " do

      zip_code = 27713
      query = "Ruby"
      indeed = Indeed.new(zip_code, query)
      response = indeed.fetch_one
      all = indeed.fetch_all
      expect(response["totalResults"]).to be all.count
    end

    it "can fetch a single posting" do
      indeed = Indeed.new
      posting_id = "0d5af1eef0379e6a"
      response = indeed.fetch_posting(posting_id)
      job_title = response["jobtitle"]
      expect(job_title).to eq "Software Engineer - University Grad"
    end

    


  end
end
# example response

# {"version"=>2,
#  "query"=>"Ruby",
#  "location"=>"27713,",
#  "paginationPayload"=>"",
#  "radius"=>25,
#  "dupefilter"=>true,
#  "highlight"=>true,
#  "totalResults"=>211,
#  "start"=>1,
#  "end"=>25,
#  "pageNumber"=>0,
#  "results"=>
#  [
# {"jobtitle"=>"Software Engineer-Ruby on Rails (VitalSource)",
#  "company"=>"Ingram Content Group",
#  "city"=>"Raleigh",
#  "state"=>"NC",
#  "country"=>"US",
#  "formattedLocation"=>"Raleigh, NC",
#  "source"=>"Ingram Content Group",
#  "date"=>"Fri, 16 Sep 2016 00:59:58 GMT",
#  "snippet"=>
#   "2 years of software development experience with <b>Ruby</b> on Rails (which can include school experience, internships, externships, or post graduate projects) OR...",
#  "url"=>
#   "http://www.indeed.com/viewjob?jk=4bcdae933761c65e&qd=O3HmOnyIGLeWF2RBoJP1KBU1X0tqOn5S3Ou5U7u-NrqrErS31xp-tub8xgCumEtJvoPVTqWEREhsEM21-hCUUf513zjraMxEIP7u569D-80&indpubnum=4757383002958308&atk=1at2o1n0ca3baeag",
#  "onmousedown"=>"indeed_clk(this,'5369');",
#  "latitude"=>35.771976,
#  "longitude"=>-78.63736,
#  "jobkey"=>"4bcdae933761c65e",
#  "sponsored"=>false,
#  "expired"=>false,
#  "indeedApply"=>false,
#  "formattedLocationFull"=>"Raleigh, NC",
#  "formattedRelativeTime"=>"4 days ago"}
#  ]
