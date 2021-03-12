class RemoveDescriptionFromPosts < ActiveRecord::Migration[6.1]
  def change
  	remove_column :posts, :description
  end
end
