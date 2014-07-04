class Task < ActiveRecord::Base
  belongs_to :project
  belongs_to :assignee, :class_name => 'User'
  belongs_to :creator, :class_name => 'User'

  #after_update :send_task_updated_email

  validates :project, :presence => true  
  validates :assignee, :presence => true

  has_attached_file :file, 
    :styles => { :medium => "300x300>", :thumb => "100x100>" }, 
    :default_url => "/images/:style/missing.png"

  validates_attachment_content_type :file, 
    :content_type => /\Aimage\/.*\Z/

  protected

  def send_task_updated_email
    UserMailer.task_updated_email(self).deliver
  end
end
