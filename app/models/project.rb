class Project < ActiveRecord::Base
  has_many :tasks
  has_many :memberships
  has_many :users, :through => :memberships

  def self.filter(query)
    query.blank? ? Project.all : Project.where("name LIKE '%#{query}%'")

    # SAME AS BELOW.
    # if query.blank?
    #   Project.all
    # else
    #   Project.where("name LIKE '%#{query}%'")
    # end
  end
end
