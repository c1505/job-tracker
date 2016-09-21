require 'rails_helper'

RSpec.feature "Jobs CRUD", type: :feature do
    it "shows the jobs index page" do
      visit '/jobs'
      expect(page).to have_content("Jobs")
    end

    it "shows a job on the index page" do
      Job.create(title: "title", company: "company")
      visit '/jobs'
      expect(page).to have_content("title")
      expect(page).to have_content("company")
      expect(current_path).to eq jobs_path
    end

    it "creates a job from the form" do
      visit '/jobs/new'
      fill_in('job_title', :with => "job title")
      fill_in('job_company', :with => "job company")
      click_button('Create Job')
      expect(page).to have_content("Job successfully created")
      expect(page).to have_content("job title")
      expect(page).to have_content("job company")
      expect(current_path).to eq '/jobs/1'

    end

    it "updates a job" do
      Job.create(title: "job title", company: "job company")
      visit '/jobs/1/edit'
      expect(page).to have_content("Edit job title")
      fill_in('job_title', :with => "job title updated")
      click_button('Update Job')
      expect(page).to have_content("job title updated")
      expect(current_path).to eq '/jobs/1'
    end

    it "deletes a job" do
      Job.create(title: "i am a title", company: "job company")
      visit '/jobs'
      click_link('Delete')
      expect(page).not_to have_content("i am a title")
      expect(page).to have_content("deleted")
      expect(current_path).to eq '/jobs'

    end
end
