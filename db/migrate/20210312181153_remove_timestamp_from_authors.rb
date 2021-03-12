class RemoveTimestampFromAuthors < ActiveRecord::Migration[6.1]
  def self.up
    remove_column :authors, :created_at
    remove_column :authors, :updated_at
  end

  def self.down
    add_column :authors, :created_at, :timestamp
    add_column :authors, :updated_at, :timestamp
  end
end
