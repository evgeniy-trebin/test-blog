class Profile < ActiveRecord::Base

  include ProfileDataStepsValidations

  belongs_to :user

  validates_presence_of :user_id

  mount_uploader :avatar, AvatarUploader, file_size: {maximum: 3.megabytes.to_i}

  validates :nickname, allow_blank: true, uniqueness: true

end
