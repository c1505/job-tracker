require 'rails_helper'

RSpec.feature "Postings", type: :feature do
  it "shows first 25 job postings" do
    visit '/postings'
    expect(page).to have_content("Job Postings")
    expect(page).to have_button("Save Job")
  end

  it "can save posting to jobs" do
    visit '/postings'
    first('.boxy').click_button("Save Job")
    expect(page).to have_content("Job successfully saved")
    expect(Job.all.count).to equal 1
    # expect(page).to have_content("e Engineer - University Grad")
    # Now that I am not
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
