require 'rails_helper'

describe "Projects" do  
  it "should create a new project" do
    visit "/projects/new"

    fill_in "Name", :with => "Learn Rails"

    fill_in "Description", :with => "New Description"

    click_button "Create Project"

    page.should have_content("Project was successfully created.")
  end

  describe "existing projects" do

    let!(:project) { FactoryGirl.create(:project) }

    it "should edit a project" do
      visit edit_project_path(project)

      fill_in "Name", :with => "New Name"

      fill_in "Description", :with => "New Description"

      click_button "Update Project"

      page.should have_content("Project was successfully updated.")
    end

  end

end