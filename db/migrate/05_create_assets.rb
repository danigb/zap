class CreateAssets < ActiveRecord::Migration
  def self.up
    create_table :assets do |t|
      t.belongs_to :user
      t.belongs_to :space
      t.string :name, :limit => 200
      t.string :description, :limit => 500
      t.string :locator
      t.timestamps
    end
  end

  def self.down
    drop_table :assets
  end
end
