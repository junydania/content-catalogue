class RemoveAttributefromVideo < ActiveRecord::Migration[5.1]
  def change
    remove_column :videos, :video_image
    add_attachment :videos, :image
  end
end
