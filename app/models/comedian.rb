class Comedian < ApplicationRecord

  has_many :videos
  validates_presence_of  :name

  def self.options_for_select
    order('LOWER(name)').map { |e| [e.name, e.id]}
  end

end

