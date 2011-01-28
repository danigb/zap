class Zap::Comment < ActiveRecord::Base
  set_table_name 'comments'
  belongs_to :user
  belongs_to :space
  belongs_to :resource, :polymorphic => true

  validates :space_id, :presence => true
  validates :resource_id, :presence => true
  validates :resource_type, :presence => true


  def self.new_for(resource)
    self.new(:resource_id => resource.id, :resource_type => resource.class.to_s)
  end
end