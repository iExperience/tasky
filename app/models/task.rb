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


  def self.due_date_chart
    LazyHighCharts::HighChart.new('graph') do |f|
      f.title(:text => "Tasks By Due Date")
      f.xAxis(:categories => [
        1.day.from_now.strftime("%b %d, %Y"), 
        2.days.from_now.strftime("%b %d, %Y"), 
        3.days.from_now.strftime("%b %d, %Y"),
        4.days.from_now.strftime("%b %d, %Y")
      ])
      f.series(:name => "Tasks Due", :yAxis => 0, :data => [
        Task.where(:due_date => (1.day.from_now.midnight)..(1.day.from_now.end_of_day)).count,
        Task.where(:due_date => (2.days.from_now.midnight)..(2.days.from_now.end_of_day)).count,
        Task.where(:due_date => (3.days.from_now.midnight)..(3.days.from_now.end_of_day)).count,
        Task.where(:due_date => (4.days.from_now.midnight)..(4.days.from_now.end_of_day)).count,
      ])

      f.yAxis [
        {:title => {:text => "Tasks Due", :margin => 70} },
      ]

      f.legend(:align => 'right', :verticalAlign => 'top', :y => 75, :x => -50, :layout => 'vertical',)
      f.chart({:defaultSeriesType=>"column"})
    end
  end

  protected

  def send_task_updated_email
    UserMailer.task_updated_email(self).deliver
  end
end
