require 'rails_helper'

RSpec.feature "Postings", type: :feature do
  it "shows first 25 job postings" do
    visit '/postings'
    expect(page).to have_content("Job Postings")
    expect(page).to have_content("Save Job")
  end

  it "the results are unique"
end

# it "shows a job on the index page" do
#   Job.create(title: "title", company: "company")
#   visit '/jobs'
#   expect(page).to have_content("title")
#   expect(page).to have_content("company")
#   expect(current_path).to eq jobs_path
# end
