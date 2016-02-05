require 'rails_helper'

RSpec.describe Account::ArticlesController, type: :routing do
  describe 'routing' do

    it 'routes to #index' do
      expect(get: '/account/articles').to route_to('account/articles#index')
    end

    it 'routes to #new' do
      expect(get: '/account/articles/new').to route_to('account/articles#new')
    end

    it 'routes to #show' do
      expect(get: '/account/articles/1').to route_to('account/articles#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/account/articles/1/edit').to route_to('account/articles#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/account/articles').to route_to('account/articles#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/account/articles/1').to route_to('account/articles#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/account/articles/1').to route_to('account/articles#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/account/articles/1').to route_to('account/articles#destroy', id: '1')
    end

  end
end
