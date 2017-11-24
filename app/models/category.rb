class Category < ApplicationRecord

  # extend FriendlyId
  # friendly_id :name, use: :slugged

  has_many :videos

  validates_presence_of :category_name

  def self.options_for_select
    order('LOWER(category_name)').map { |e| [e.category_name, e.id]}
  end

end
