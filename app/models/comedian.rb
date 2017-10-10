class Comedian < ApplicationRecord

  has_many :videos
  validates_presence_of  :name

  def self.options_for_select
    order('LOWER(name)').map { |e| [e.name, e.id]}
  end

  scope :search_query, (lambda { |query|
    return nil  if query.blank?

    terms = query.downcase.split(/\s+/)
    terms = terms.map { |e|
      (e.gsub('*', '%') + '%').gsub(/%+/, '%')
    }
    num_or_conditions = 2
    where(
        terms.map {
          or_clauses = [
              "LOWER(comedians.name) LIKE ?",
              "LOWER(videos.title) LIKE ?"
          ].join(' OR ')
          "(#{ or_clauses })"
        }.join(' AND '),
        *terms.map { |e| [e] * num_or_conditions }.flatten
    ).joins(:videos)
  })

end

