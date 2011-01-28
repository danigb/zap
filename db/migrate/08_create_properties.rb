class CreateProperties < ActiveRecord::Migration
  def self.up
    create_table :properties do |t|
      t.belongs_to :resouce,  :polymorphic => true
      t.belongs_to :space
      t.string :name, :limit => 100
      t.string :value, :limit => 500
      t.timestamps
    end
  end

  def self.down
    drop_table :properties
  end
end
