class AddFileToTasks < ActiveRecord::Migration
  def change
    add_attachment :tasks, :file
  end
end
