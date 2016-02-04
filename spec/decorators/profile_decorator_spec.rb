require 'spec_helper'

describe ProfileDecorator do

  # #full_name
  # ------------------------------------------------------------------
  describe '#full_name' do
    it 'returns full name' do
      profile = create(:profile, name: 'Ivan', surname: 'Ivanov').decorate
      empty_profile = create(:user).profile.decorate
      expect(profile.full_name).to eq('Ivan Ivanov')
      expect(empty_profile.full_name).to eq('')
    end
  end

  # #show_name
  # ------------------------------------------------------------------
  describe '#show_name' do
    # when nickname exists
    # ----------------------------------------------------------------
    context 'when nickname exists' do
      it 'returns nickname' do
        nickname = 'chubakka'
        profile = create(:profile, nickname: nickname).decorate
        expect(profile.show_name).to eq(nickname)
      end
    end
    # when nickname is empty and name or surname exits
    # ----------------------------------------------------------------
    context 'when nickname is empty and name or surname exits' do
      it 'returns full name' do
        profile = create(:profile, name: 'Ivan', surname: 'Ivanov').decorate
        expect(profile.show_name).to eq('Ivan Ivanov')
      end
    end
    # when profile is empty
    # ----------------------------------------------------------------
    context 'when profile is empty' do
      it 'returns full name' do
        profile = create(:user).profile.decorate
        expect(profile.show_name).to eq(profile.user.email)
      end
    end
  end

end
