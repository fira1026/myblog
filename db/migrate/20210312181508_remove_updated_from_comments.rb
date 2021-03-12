class RemoveUpdatedFromComments < ActiveRecord::Migration[6.1]
  def self.up
    remove_column :comments, :updated_at
  end

  def self.down
    add_column :comments, :updated_at, :timestamp
  end
end
