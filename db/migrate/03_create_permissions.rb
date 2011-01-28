class CreatePermissions < ActiveRecord::Migration
  def self.up

    create_table :permissions do |t|
      t.belongs_to :resource,  :polymorphic => true
      t.references :user
      t.string :level, :limit => 8
    end
    
    add_index :permissions, [:resource_id, :resource_type], :name => 'resource_index'
    add_index :permissions, :user_id, :name => 'user_index'
  end

  def self.down
    drop_table :permissions
  end
end
