class Video < ApplicationRecord
  protokoll :video_key, :pattern => "LH%Y#####"

  belongs_to  :publisher
  belongs_to  :comedian
  belongs_to  :category

  has_attached_file :image, styles: { medium: "300x300>", thumb: "150x150>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  validates_attachment_file_name :image, matches: [/png\z/, /jpe?g\z/]
  validates_presence_of :title, :description, :video_storage_path, :comedian_id, :publisher_id, :category_id

  scope :with_comedian_id, (lambda {|comedian_id|
    where(comedian_id: [*comedian_id])})

  scope :with_publisher_id, (lambda {|publisher_id|
    where(publisher_id: [*publisher_id])})

  scope :with_category_id, (lambda {|category_id|
      where(category_id: [*category_id])})

  scope :with_comedian_name, (lambda {|comedian_name|
    where('comedians.name = ?', comedian_name).joins(:comedian)
  })

  scope :with_publisher_name, (lambda {|publisher_name|
    where('publishers.publisher_name = ?', publisher_name).joins(:publisher)
  })

  scope :with_category_name, (lambda {|category_name|
    where('categories.category_name = ?', category_name).joins(:category)
  })

  scope :sorted_by, (lambda { |sort_option|
    direction = (sort_option =~ /desc$/) ? 'desc' : 'asc'
    case sort_option.to_s
      when /^created_at_/
        order("videos.created_at #{direction}")
      when /^title_/
        order("LOWER(videos.title) #{direction}")
      when /^comedian_name_/
        order("LOWER(comedians.name) #{direction}").includes(:country)
      when /^publisher_name/
        order("LOWER(publishers.name) #{direction}").includes(:publisher)
      else
        raise(ArgumentError, "Invalid sort option: #{ sort_option.inspect }")
    end
  })

  scope :created_at_gte, (lambda { |reference_time|
    where('videos.created_at >= ?', reference_time)
  })


  scope :search_query, (lambda {|query|
    return nil if query.blank?

    terms = query.downcase.split(/\s+/)

    terms = terms.map { |e|
      (e.gsub('*', '%') + '%').gsub(/%+/, '%')
    }

    num_or_conds = 2
    where(terms.map { |term|
      "LOWER(comedians.name) LIKE ? OR LOWER(videos.title) LIKE ?)"
    }, *terms.map { |e| [e] * num_or_conds }.flatten )
  })

  filterrific(
      default_filter_params: { sorted_by: 'created_at_desc' },
      available_filters: [
          :sorted_by,
          :search_query,
          :with_comedian_name,
          :with_publisher_name,
          :with_category_name,
          :with_created_at_gte
      ]
  )

  def self.options_for_sorted_by
    [
        ['Title (a-z)', 'title_asc'],
        ['Created date (newest first)', 'created_at_desc'],
        ['Created Date (oldest first)', 'created-at_asc'],
        ['Publisher (a-z)', 'publisher_name_asc' ]
    ]
  end

end



