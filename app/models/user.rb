class User < ActiveRecord::Base

  extend Enumerize

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  STATUS_ACTIVE = :active
  STATUS_BANNED = :banned

  enumerize :status, in: [STATUS_ACTIVE, STATUS_BANNED], default: STATUS_ACTIVE

end
