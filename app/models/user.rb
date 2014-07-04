class User < ActiveRecord::Base
  has_many :memberships, :dependent => :destroy
  has_many :projects, :through => :memberships
  has_many :tasks, :foreign_key => :assignee_id
end