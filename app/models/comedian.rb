class Comedian < ApplicationRecord

  extend FriendlyId
  friendly_id :name, use: [:slugged, :history]

  has_many :videos
  validates_presence_of  :name

  def self.options_for_select
    order('LOWER(name)').map { |e| [e.name, e.id]}
  end

end

