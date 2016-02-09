require 'rails_helper'

RSpec.describe 'account/articles/index', type: :view do

  before(:all) do
    @articles = create_list(:article, 3)
  end

  it 'table with articles' do
    stub_articles_list { @articles }
    render
    expect(rendered).to match(%r{table})
    @articles.each do |article|
      expect(rendered).to match %r{#{article.title}}
    end
  end

  it '#h1 Listing articles' do
    stub_articles_list { @articles }
    render
    expect(rendered).to match %r{Listing articles}
  end

end