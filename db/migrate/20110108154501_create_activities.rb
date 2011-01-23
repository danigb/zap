class CreateActivities < ActiveRecord::Migration
  def self.up
    create_table :activities do |t|
      t.string :action
      t.string :resource_class
      t.references :resource
      t.references :user
      t.timestamps
    end
  end

  def self.down
    drop_table :activities
  end
end
