require 'rails_helper'

RSpec.describe 'account/articles/show', type: :view do

  it '#h1 article title' do
    article = create(:article)
    stub_article { article }
    render
    expect(rendered).to match %r{<h1>\s?+#{article.title}\s?+</h1>}
  end

end