class School < ActiveRecord::Base
  include PgSearch

  has_many :videos, as: :videoed

  validates :ipeds_id, presence: true
  validates :name, presence: true
  validates :as_of_year, presence: true
  validates :total_price_in_state_on_campus, numericality: { greater_than_or_equal_to: 0 }
  validates :total_price_out_of_state_on_campus, numericality: { greater_than_or_equal_to: 0 }
  validates :street_address, presence: true
  validates :city, presence: true
  validates :postal_code, presence: true
  validates :state_code, presence: true
  validates :general_phone_number, presence: true
  validates :highest_level_of_offering, presence: true
  validates :undergraduate_offering, presence: true
  validates :highest_degree_offered, presence: true
  validates :longitude, presence: true
  validates :latitude, presence: true
  validates :open_to_the_general_public, inclusion: { in: [true, false] }
  validates :status, presence: true
  validates :occupational, inclusion: { in: [true, false] }
  validates :academic, inclusion: { in: [true, false] }
  validates :associates_degree, inclusion: { in: [true, false] }
  validates :bachelors_degree, inclusion: { in: [true, false] }
  validates :open_admissions, inclusion: { in: [true, false] }
  validates :applicants, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true
  validates :admissions, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true
  validates :admissions_percentage, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true
  validates :sat_reading_25th_percentile, numericality: { greater_than_or_equal_to: 0}, allow_nil: true
  validates :sat_reading_75th_percentile, numericality: { greater_than_or_equal_to: 0}, allow_nil: true
  validates :sat_math_25th_percentile, numericality: { greater_than_or_equal_to: 0}, allow_nil: true
  validates :sat_math_75th_percentile, numericality: { greater_than_or_equal_to: 0}, allow_nil: true
  validates :sat_writing_25th_percentile, numericality: { greater_than_or_equal_to: 0}, allow_nil: true
  validates :sat_writing_75th_percentile, numericality: { greater_than_or_equal_to: 0}, allow_nil: true
  validates :act_composite_25th_percentile, numericality: { greater_than_or_equal_to: 0}, allow_nil: true
  validates :act_composite_75th_percentile, numericality: { greater_than_or_equal_to: 0}, allow_nil: true
  validates :act_english_25th_percentile, numericality: { greater_than_or_equal_to: 0}, allow_nil: true
  validates :act_english_75th_percentile, numericality: { greater_than_or_equal_to: 0}, allow_nil: true
  validates :act_math_25th_percentile, numericality: { greater_than_or_equal_to: 0}, allow_nil: true
  validates :act_math_75th_percentile, numericality: { greater_than_or_equal_to: 0}, allow_nil: true
  validates :act_writing_25th_percentile, numericality: { greater_than_or_equal_to: 0}, allow_nil: true
  validates :act_writing_75th_percentile, numericality: { greater_than_or_equal_to: 0}, allow_nil: true
  validates :dual_credit, inclusion: { in: [true, false] }
  validates :life_experience_credit, inclusion: { in: [true, false] }
  validates :all_remote, inclusion: { in: [true, false ] }
  validates :study_abroad, inclusion: { in: [true, false] }
  validates :evenings_and_weekends, inclusion: { in: [true, false] }
  validates :tuition_payment_plan, inclusion: { in: [true, false] }
  validates :undergraduate_application_fee, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true
  validates :on_campus_housing, inclusion: { in: [true, false] }
  validates :undergraduate_out_of_state_tuition_average, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true
  validates :undergraduate_in_state_tuition, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true
  validates :undergraduate_books_and_supplies, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true
  validates :undergraduate_on_campus_room_and_board, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true
  validates :undergraduate_percent_receiving_financial_aid, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true
  validates :undergraduate_average_financial_aid, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true
  validates :member_of_ncaa, inclusion: { in: [true, false] }
  validates :member_of_naia, inclusion: { in: [true, false] }
  validates :has_football_team, inclusion: { in: [true, false] }
  validates :has_basketball_team, inclusion: { in: [true, false] }
  validates :enrollment_total, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true
  validates :undergraduate_enrollment, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true
  validate :url_formats

  before_validation :set_admission_percentage, if: -> { applicants && admissions }
  before_validation :clean_urls
  
  pg_search_scope :search, :against => [:name, :football_conference, :city], using: { :tsearch => { prefix: true } }
  scope :non_active, -> { where.not(status: "Active - institution active") }
  scope :kaylas_list, (-> {
    ipeds_ids = %W(170976 240444 145637 174066 204796)
    where(ipeds_id: ipeds_ids)
  })
  scope :new_york_city, (-> {
    where(city: "New York", state_code: "New York").order("undergraduate_enrollment desc nulls last")
  })
  scope :dream, (-> {
    ipeds_ids = %W(193900 166027 190150 186131 130794 110662 110635 170976 240444)
    where(ipeds_id: ipeds_ids)
  })

  scope :study_abroad, (-> {
    where(study_abroad: true).order("undergraduate_enrollment desc nulls last")
  })

  def self.scopes
    ["kaylas_list","new_york_city","dream","study_abroad"]
  end

  def self.football_conferences
    School.group("football_conference").
      sum("undergraduate_enrollment").
      sort { |a,b| b[1] <=> a[1] }.
      select { |conference, enrollment| conference }.
      collect { |conference, enrollment| conference }
  end


  def mission_statement?
    mission_statement.present? || mission_statement_url.present?
  end

  def non_active?
    status != "Active - institution active"
  end

  def college_navigator_profile_url
    "http://nces.ed.gov/collegenavigator/?id=#{ipeds_id}"
  end

  def featured_video
    @featured_video ||= begin
      videos.featured.first || videos.first
    end
  end

  def retrieve_videos
    you_tube_client = YouTubeClient.new
    tour_query = "#{name} Tour"
    result = you_tube_client.search(tour_query)
    result.videos.each do |youtube_video|
      videos.where(youtube_id: youtube_video.unique_id).first_or_initialize do |v|
        v.duration = youtube_video.duration
        v.title = youtube_video.title
        v.description = youtube_video.description
        v.thumbnail_url = youtube_video.thumbnails.find { |t| t.name == "mqdefault" }.try(:url)
      end.save!
    end
    update!(videos_last_retrieved_at: Time.now.utc)
  end

  def to_param
    "#{id}-#{name.gsub(/\W/,"-")}"
  end

private

  def set_admission_percentage
    return unless admissions && applicants
    percentage = (admissions / applicants.to_f)
    self.admissions_percentage = percentage if percentage > 0 && percentage <= 1
  end

  def url_formats
    url_attributes.each do |url_attribute|
      if send(url_attribute).present? && !send(url_attribute).include?("http")
        self.errors[url_attribute] << "must be a valid url"
      end
    end
  end

  def clean_urls
    url_attributes.each do |url_attribute|
      self.send("#{url_attribute}=", clean_url(send(url_attribute)))
    end
  end

  def url_attributes
    [:mission_statement_url, :financial_aid_url, :admissions_url, :online_application_url, :net_price_calculator_url]
  end

  def clean_url(url)
    return unless url.present?
    return "http://" + url unless url.include?("http")
    url
  end

end
