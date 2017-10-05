class Category < ApplicationRecord

  has_many :videos

  validates_presence_of :category_name

  def self.options_for_select
    order('Lower(category_name)').map { |e| [e.category_name, e.id]}
  end

end
