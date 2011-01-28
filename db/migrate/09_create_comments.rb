class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.belongs_to :resource,  :polymorphic => true
      t.belongs_to :space
      t.belongs_to :user
      t.text :body
      t.datetime :created_at
    end
  end

  def self.down
    drop_table :comments
  end
end
