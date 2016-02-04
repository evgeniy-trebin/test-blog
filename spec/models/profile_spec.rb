require 'rails_helper'

RSpec.describe Profile, type: :model do

  it { should validate_presence_of(:user_id) }

  # module ProfileDataStepsValidations
  # ------------------------------------------------------------------
  describe 'ProfileDataStepsValidations' do

    before(:each) do
      @profile = create(:profile, name: nil, surname: nil, status_text: nil, avatar: nil)
    end

    # step Personal Info
    # ----------------------------------------------------------------
    context '#personal_info step' do

      before(:each) do
        @profile.step_validation = :personal_info
      end

      it 'should validate_presence_of :name ' do
        expect(@profile).not_to be_valid
        expect(@profile.errors.has_key?(:name)).to be_truthy
      end

      it 'should validate_presence_of :surname ' do
        expect(@profile).not_to be_valid
        expect(@profile.errors.has_key?(:surname)).to be_truthy
      end
    end

    # step Avatar
    # ----------------------------------------------------------------
    context '#avatar step' do

      it 'should validate_presence_of :avatar ' do
        @profile.step_validation = :avatar
        expect(@profile).not_to be_valid
        expect(@profile.errors.has_key?(:avatar)).to be_truthy
      end

    end
  end

end