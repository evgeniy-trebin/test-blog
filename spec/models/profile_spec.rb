require 'rails_helper'

RSpec.describe Profile, type: :model do

  subject { create(:profile) }

  it { should validate_presence_of(:user_id) }
  it { should validate_uniqueness_of(:nickname).allow_blank }

  # module ProfileDataStepsValidations
  # ------------------------------------------------------------------
  describe 'ProfileDataStepsValidations' do

    # step Personal Info
    # ----------------------------------------------------------------
    context '#personal_info step' do

      subject do
        profile = create(:profile)
        profile.step_validation = :personal_info
        profile
      end

      it { should validate_presence_of(:name)}
      it { should validate_presence_of(:surname)}
      it { should validate_presence_of(:nickname)}
    end

    # step Avatar
    # ----------------------------------------------------------------
    context '#avatar step' do

      subject do
        profile = create(:profile)
        profile.step_validation = :avatar
        profile
      end

      it { should validate_presence_of(:avatar)}
    end

  end

end