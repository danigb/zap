class Zap::Space < ActiveRecord::Base
  set_table_name 'spaces'
  acts_as_taggable
  simple_audit :except => [:created_at, :updated_at]

  has_many :permissions, :foreign_key => :resource_id, :conditions => "resource_type = 'Zap::Space'"
  has_many :users, :through => :permissions, :source => :resource, :source_type => "User",
      :conditions => "permissions.resource_type = 'User'"
  has_many :comments, :foreign_key => :resource_id, :conditions => "resource_type = 'Zap::Space'"
  has_many :assets

  validates :name, :presence => true
  
  def parent_id
    self.id
  end
end
