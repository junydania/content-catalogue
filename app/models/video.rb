class Video < ApplicationRecord

  extend FriendlyId
  friendly_id :title, use: [:slugged, :history]

  protokoll :video_key, :pattern => "LH%Y#####"

  belongs_to  :publisher
  belongs_to  :comedian
  belongs_to  :category

  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images"
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
      when /^name/
        order("LOWER(comedians.name) #{direction}").joins(:comedian)
      when /^publisher_name/
        order("LOWER(publishers.publisher_name) #{direction}").joins(:publisher)
      else
        raise(ArgumentError, "Invalid sort option: #{ sort_option.inspect }")
    end
  })

  scope :created_at_gte, (lambda { |reference_time|
    where('videos.created_at >= ?', reference_time)
  })


  scope :search_query, (lambda { |query|
    nil if query.blank?
    terms = query.to_s.downcase.split(/\s+/)
    terms = terms.map { |e|
      (e.gsub('*', '%') + '%').gsub(/%+/, '%')
    }
    num_or_conditions = 2
    where(
        terms.map {
          or_clauses = [
              "LOWER(videos.title) LIKE ?",
              "LOWER(videos.video_key) LIKE ?"
          ].join(' OR ')
          "(#{ or_clauses })"
        }.join(' AND '),
        *terms.map { |e| [e] * num_or_conditions }.flatten
    ).joins(:comedian)
  })


  filterrific(
      default_filter_params: { sorted_by: 'created_at_desc' },
      available_filters: [
        :sorted_by,
        :search_query,
        :with_comedian_id,
        :with_publisher_id,
        :with_category_id,
        :with_created_at_gte
      ]
  )

  def self.options_for_sorted_by
    [
        ['Title (a-z)', 'title_asc'],
        ['Created date (newest first)', 'created_at_desc'],
        ['Created Date (oldest first)', 'created-at_asc'],
        ['Publisher (a-z)', 'publisher_name_asc'],
        ['Comedian (a-z)', 'name_asc' ]
    ]
  end

  def self.to_csv(options={})
    # attributes = %w{ video_key title description video_storage_path release_date   }
    columns =  ["id", "video_key", "title", "description", "release_date", "video_storage_path", "created_at", "comedian_name", "publisher_name", "video_category"]
    CSV.generate(options) do |csv|
      csv << columns.map(&:humanize)
      with_comedian_details.each do |video|
        csv << video.attributes.values_at(*columns)
      end
    end
  end

  def self.with_comedian_details
    Video.select('videos.*,
                  publishers.publisher_name as publisher_name,
                  comedians.name as comedian_name,
                  categories.category_name as video_category')
                  .joins(:publisher, :comedian, :category)
  end

end




