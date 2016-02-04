require 'rails_helper'

RSpec.describe Profile::PersonalInfo, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:surname) }
end
