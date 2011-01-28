class Zap::Permission < ActiveRecord::Base
  set_table_name 'permissions'
  belongs_to :user
  belongs_to :resource, :polymorphic => true
  
  LEVELS = [:read, :write, :manage]

  validates :user, :presence => true
  validates_uniqueness_of :user_id, :scope => [:resource_id, :resource_type]
  validates :resource_id, :presence => true
  validates :resource_type, :presence => true
  validates :level, :presence => true
  
  def self.new_for(resource)
    self.new(:resource_id => resource.id, :resource_type => resource.class.to_s)
  end
end
