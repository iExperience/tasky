# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

[User, Project, Task, Membership].map(&:destroy_all)

salman = User.create(:name => "Salman Ansari", :email => "salman@ixperience.co.za")
zack = User.create(:name => "Zack Chauvin", :email => "zack@ixperience.co.za")
francois = User.create(:name => "Francois Kassier", :email => "francois@ixperience.co.za")

users = [salman, zack, francois]

project_names = ["Build Curricum", "Write Exercises", "Develop Features", "Pitch Products", "Clean House", "Learn Rails", "Hike Table Mountain", "Visit Bo-Kaap", "Eat Everything", "Dance the Night Away"]
projects = []

project_names.each do |name|
  projects << Project.create!(:name => name)
end

tasks = {
  "Clean Room" => "Pick up everything, then organize it, then put it in the right place.",
  "Do Dishes" => "Go to the kitchen, get the soap, turn on the sink, wash wash wash!",
  "Take Pictures" => "Get the fancy camera, get into position, wait for it... SNAP!",
  "Light a Fire" => "Get some sticks, and some stones, then do something...",
  "Have a Party" => "Buy some balloons, turn on some music, dance dance DANCE...",
  "Build a Castle" => "Become rich, do lots of stuff, then build a castle"
}

projects.each do |project|
  tasks.each do |name, desc|
    project.tasks << Task.new(
      :name => name, 
      :description => desc, 
      :assignee => users[rand(users.size)]
    )
  end
end