require "rails_helper"

describe ProjectsController do
  describe "GET index" do
    it "has a 200 status code" do
      get :index
      response.code.should eq("200")
    end
  end

  describe "PUT update" do
    it "should update the project name" do
      project = FactoryGirl.create(:project)
      put :update, :id => project.id, :project => {:name => "hello"}
      project.reload.name.should == "hello"
    end

    it "should update the project description" do
      project = FactoryGirl.create(:project)

      put :update, :id => project.id, :project => {:description => "hey describing thing"}

      project.reload.description.should == "hey describing thing"
    end
  end
end