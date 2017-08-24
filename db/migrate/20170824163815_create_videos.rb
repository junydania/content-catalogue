class CreateVideos < ActiveRecord::Migration[5.1]
  def change
    create_table :videos do |t|
      t.string :title
      t.integer :video_key
      t.string :description
      t.string :video_image
      t.date :release_date
      t.string :video_storage_path

      t.timestamps
    end
  end
end
