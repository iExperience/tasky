class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.integer :project_id
      t.integer :assignee_id
      t.text :description
      t.string :name
      t.string :status
      t.integer :creator_id

      t.timestamps
    end
  end
end
