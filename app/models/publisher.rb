class Publisher < ApplicationRecord

  extend FriendlyId
  friendly_id :publisher_name, use: [:slugged, :history]

  has_many :videos
  validates_presence_of :publisher_name

  def self.options_for_select
    order('LOWER(publisher_name)').map { |e| [e.publisher_name, e.id]}
  end

end
