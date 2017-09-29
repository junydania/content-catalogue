class Category < ApplicationRecord

  has_many :videos

  validates_presence_of :category_name
end
