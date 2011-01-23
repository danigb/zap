class CreateAssets < ActiveRecord::Migration
  def self.up
    create_table :assets do |t|
      t.references :user
      t.references :project
      t.string :name, :limit => 100
      t.string :description, :limit => 500
      t.string :asset
      t.timestamps
    end
  end

  def self.down
    drop_table :assets
  end
end
