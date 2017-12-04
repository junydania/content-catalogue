class AddSlugToVideos < ActiveRecord::Migration[5.1]
  def change
    add_column :videos, :slug, :string
    add_index :videos, :slug
  end
end
