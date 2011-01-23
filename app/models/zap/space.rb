class Zap::Space < ActiveRecord::Base
  set_table_name 'spaces'
  has_many :memberships
  has_many :users, :through => :memberships
  simple_audit :except => [:created_at, :updated_at]

  validates :name, :presence => true
end
