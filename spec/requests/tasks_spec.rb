require 'rails_helper'

describe "Task Management" do
  it "User creates a new task" do
    @project = FactoryGirl.create(:project)
    @user = FactoryGirl.create(:user)

    visit "/tasks/new"

    fill_in "Name", :with => "New Task"

    fill_in "Description", :with => "New Description"

    select @project.name, :from => "Project"

    select @user.name, :from => "Assignee"

    click_button "Create Task"

    page.should have_content("Task was successfully created.")
  end
end