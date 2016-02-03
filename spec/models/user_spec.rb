require 'rails_helper'

RSpec.describe User, type: :model do

  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password) }
  it { should validate_confirmation_of(:password) }

  it { should enumerize(:status).in(User::STATUS_ACTIVE, User::STATUS_BANNED).with_default(User::STATUS_ACTIVE) }

  #TODO other devise validations

end
