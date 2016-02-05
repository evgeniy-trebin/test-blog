class User < ActiveRecord::Base

  extend Enumerize

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  STATUS_ACTIVE = :active
  STATUS_BANNED = :banned

  enumerize :status, in: [STATUS_ACTIVE, STATUS_BANNED], default: STATUS_ACTIVE

  with_options inverse_of: :user, dependent: :destroy do
    has_one :profile
    has_many :articles
  end

  before_create :build_default_profile

  private

  def build_default_profile
    build_profile
  end

end
