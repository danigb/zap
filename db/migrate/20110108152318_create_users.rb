class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :name, :limit => 100
      t.string :email, :limit => 200
      t.string :avatar_url, :limit => 300
      t.string :roles
      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
