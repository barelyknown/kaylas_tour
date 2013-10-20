class Video < ActiveRecord::Base

  belongs_to :videoed, polymorphic: true

  validates :youtube_id, presence: true
  validate :one_feature_per_videoed, if: :featured?

  before_validation :unfeature_other_videos, if: -> { featured? && featured_changed? }

  scope :featured, -> { where(featured: true) }

  acts_as_list scope: [:videoed_id, :videoed_type]

  def embed_url
    "http://www.youtube.com/embed/#{youtube_id}"
  end

  def youtube_url
    "http://www.youtube.com/watch?v=#{youtube_id}"
  end

  def one_feature_per_videoed
    if videoed.videos.featured.where.not(id: id).any?
      errors[:featured] << "only one video can be featured"
    end
  end

  def unfeature_other_videos
    return unless videoed
    videoed.videos.featured.where.not(id: id).update_all(featured: false)
  end

end
