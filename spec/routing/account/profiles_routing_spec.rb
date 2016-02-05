require 'rails_helper'

RSpec.describe Account::ProfilesController, type: :routing do
  describe '#routing' do
    it 'routes to #show' do
      expect(get: '/account/profile').to route_to('account/profiles#show')
    end
  end
end
