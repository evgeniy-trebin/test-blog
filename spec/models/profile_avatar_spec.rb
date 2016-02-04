require 'rails_helper'

RSpec.describe Profile::Avatar, type: :model do
  it { should validate_presence_of(:avatar) }
end
