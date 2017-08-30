class Publisher < ApplicationRecord

  has_many :videos
  validates_presence_of :publisher_name
  
end
