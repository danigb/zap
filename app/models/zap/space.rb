class Zap::Space < ActiveRecord::Base
  set_table_name 'spaces'
  simple_audit :except => [:created_at, :updated_at]
  has_many :memberships
  has_many :users, :through => :memberships

  validates :name, :presence => true
end
