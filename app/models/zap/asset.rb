class Zap::Asset < ActiveRecord::Base
  set_table_name 'assets'
  belongs_to :user
  belongs_to :space
  mount_uploader :locator, Zap::AssetUploader
  
  validates :name, :presence => true
  validates :user, :presence => true
  validates :space, :presence => true
  
end
