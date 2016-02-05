require 'rails_helper'

RSpec.describe User, type: :model do

  it { should have_one(:profile).dependent(:destroy) }

  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password) }
  it { should validate_confirmation_of(:password) }

  it { should enumerize(:status).in(User::STATUS_ACTIVE, User::STATUS_BANNED).with_default(User::STATUS_ACTIVE) }

  #TODO other devise validations

  describe '#callbacks' do
    it 'creates profile after_create' do
      user = build(:user)
      expect(user.profile).to be_nil
      user.save
      expect(user.profile).to be_a(Profile)
    end

    it 'must not create profile after update' do
      user = create(:user)
      profile = user.profile
      user.email = Faker::Internet.email
      user.save
      expect(profile.id).to eq(Profile.find_by(user_id: user.id).id)
    end
  end

end
