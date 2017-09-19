class Video < ApplicationRecord
  protokoll :video_key, :pattern => "LH%Y#####"

  belongs_to  :publisher
  belongs_to  :comedian

  has_attached_file :image, styles: { medium: "300x300>", thumb: "150x150>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  validates_attachment_file_name :image, matches: [/png\z/, /jpe?g\z/]
  validates_presence_of :title, :description, :video_storage_path, :comedian_id, :publisher_id, :category_id

end

