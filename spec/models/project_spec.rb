require 'rails_helper'

describe Project do
  describe "validations" do
    it "should require name to be set" do
      project = Project.new(:description => "Hey")
      project.name = nil
      project.should_not be_valid
      project.name = "Hello"
      project.should be_valid
    end

    it "should require description to be set" do
      project = Project.new(:name => "Hello")
      project.description = nil
      project.should_not be_valid
      project.description = "Hello"
      project.should be_valid
    end
  end
end