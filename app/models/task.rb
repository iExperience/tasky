class Task < ActiveRecord::Base
  belongs_to :project
  belongs_to :assignee, :class_name => 'User'
  belongs_to :creator, :class_name => 'User'

  after_update :send_task_updated_email

  validates :project, :presence => true
  validates :assignee, :presence => true

  protected

  def send_task_updated_email
    UserMailer.task_updated_email(self).deliver
  end
end
