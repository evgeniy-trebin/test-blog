require 'spec_helper'

describe ProfileDecorator do

  it 'returns full name' do
    profile = create(:profile, name: 'Ivan', surname: 'Ivanov').decorate
    empty_profile = create(:user).profile.decorate
    expect(profile.full_name).to eq(('Ivan Ivanov'))
    expect(empty_profile.full_name).to eq('')
  end

end
