class CreateSpaces < ActiveRecord::Migration
  def self.up
    create_table :spaces do |t|
      t.string :name, :limit => 300
      t.string :description, :limit => 1024
      t.string :properties, :limit => 1024
      t.timestamps
    end

    create_table :memberships do |t|
      t.references :space
      t.references :user
      t.string :level, :limit => 8
    end
  end

  def self.down
    drop_table :spaces
    drop_table :memberships
  end
end
