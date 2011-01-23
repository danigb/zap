class Zap::Space < ActiveRecord::Base
  set_table_name 'spaces'
  has_many :memberships
  has_many :users, :through => :memberships

  validates :name, :presence => true
end
