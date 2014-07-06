class AddCompletedToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :completed_date, :datetime
  end
end
