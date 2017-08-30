class ChangeVideoAttribute < ActiveRecord::Migration[5.1]
  def change
    remove_column :videos, :video_key
    add_column :videos, :video_key, :string
  end
end

