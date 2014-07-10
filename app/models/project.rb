class Project < ActiveRecord::Base
  has_many :tasks, :dependent => :destroy
  has_many :memberships, :dependent => :destroy
  has_many :users, :through => :memberships

  validates :name, :description, :presence => true

  def self.filter(query)
    query.blank? ? Project.all : Project.where("lower(name) LIKE '%#{query.downcase}%'")

    # SAME AS BELOW.
    # if query.blank?
    #   Project.all
    # else
    #   Project.where("name LIKE '%#{query}%'")
    # end
  end

  def due_dates_chart
    LazyHighCharts::HighChart.new('graph') do |f|
      f.title(:text => "Task Due Dates")
      f.xAxis(:categories => [
        1.day.from_now.strftime("%b %d"),
        2.days.from_now.strftime("%b %d"),
        3.days.from_now.strftime("%b %d"),
        4.days.from_now.strftime("%b %d")
      ])

      f.series(:name => "Tasks", :yAxis => 0, :data => [
        self.tasks.where(:due_date => (1.day.from_now.midnight..2.days.from_now.midnight)).count, 
        self.tasks.where(:due_date => (2.days.from_now.midnight..3.days.from_now.midnight)).count,
        self.tasks.where(:due_date => (3.days.from_now.midnight..4.days.from_now.midnight)).count,
        self.tasks.where(:due_date => (4.days.from_now.midnight..5.days.from_now.midnight)).count
      ])

      f.yAxis [
        {:title => {:text => "Tasks", :margin => 70} }
      ]

      f.legend(:align => 'right', :verticalAlign => 'top', :y => 75, :x => -50, :layout => 'vertical',)
      f.chart({:defaultSeriesType=>"column"})
    end
  end
end
