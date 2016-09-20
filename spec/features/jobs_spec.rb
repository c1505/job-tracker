require 'rails_helper'

RSpec.feature "Jobs", type: :feature do
  feature "index page" do
    it "shows the jobs index page" do
      visit '/jobs'
      expect(page).to have_content("Jobs")
    end

    it "shows a job on the index page" do
      Job.create(title: "title", company: "company")
      visit '/jobs'
      expect(page).to have_content("title")
      expect(page).to have_content("company")
    end

    it "creates a job from the form" do
      visit '/jobs/new'
      fill_in('job_title', :with => "job title")
      fill_in('job_company', :with => "job company")
      click_button('Create Job')
      expect(page).to have_content("Job successfully created")
      expect(page).to have_content("job title")
      expect(page).to have_content("job company")
    end


  end
end
