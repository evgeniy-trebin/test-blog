class Article < ActiveRecord::Base

  extend Enumerize

  belongs_to :user

  ANNOUNCE_LENGTH_MIN = 150
  ANNOUNCE_LENGTH_MAX = 500

  CONTENT_LENGTH_MIN = 500

  STATUS_NEW = :new
  STATUS_ON_MODERATION = :on_moderation
  STATUS_FOR_REVISION = :for_revision
  STATUS_ACTIVE = :active
  STATUS_FROZEN = :frozen

  enumerize :status, in: [STATUS_NEW, STATUS_ON_MODERATION, STATUS_FOR_REVISION, STATUS_ACTIVE, STATUS_FROZEN], default: STATUS_NEW

  validates_presence_of :title, :announce, :content, :user_id
  validates_length_of :announce, allow_nil: true, minimum: ANNOUNCE_LENGTH_MIN, maximum: ANNOUNCE_LENGTH_MAX
  validates_length_of :content, allow_nil: true, minimum: CONTENT_LENGTH_MIN

  validates_presence_of :published_at, if: :should_validate_published_at?

  private

  def should_validate_published_at?
    is_published?
  end

end
