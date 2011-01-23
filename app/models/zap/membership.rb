class Zap::Membership < ActiveRecord::Base
  set_table_name 'memberships'
  belongs_to :user
  belongs_to :space

  validates :user, :presence => true
  validates_uniqueness_of :user_id, :scope => :space_id
  validates :space, :presence => true
  validates_uniqueness_of :space_id, :scope => :user_id
  validates :level, :presence => true
end
