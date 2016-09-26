require 'rails_helper'

RSpec.feature "Postings", type: :feature do
  it "shows first 25 job postings" do
    visit '/postings'
    expect(page).to have_content("Job Postings")
    expect(page).to have_content("Save Job")
  end

  it "the results are unique"

  it "can save posting to jobs" do
    visit '/postings'
    first('.boxy').click_link("Save Job")
    expect(page).to have_content("Job successfully saved")
    # click link
    # saves job posting
    # gives a message if it was successful
  end
end

# it "shows a job on the index page" do
#   Job.create(title: "title", company: "company")
#   visit '/jobs'
#   expect(page).to have_content("title")
#   expect(page).to have_content("company")
#   expect(current_path).to eq jobs_path
# end
