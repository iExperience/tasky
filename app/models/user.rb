class User < ActiveRecord::Base
  has_many :memberships
  has_many :projects, :through => :memberships
  has_many :tasks, :foreign_key => :assignee_id
end
