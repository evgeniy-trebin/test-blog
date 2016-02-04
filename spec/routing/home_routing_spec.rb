require 'rails_helper'

RSpec.describe HomeController, type: :routing do
  describe '#routing' do
    it 'routes to #welcome' do
      expect(get: '/').to route_to('home#welcome')
    end
  end
end
