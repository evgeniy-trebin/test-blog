require 'rails_helper'

RSpec.describe 'account/articles/edit', type: :view do
  it 'renders the edit article form' do
    article = create(:article)
    stub_article { article }
    render
    expect(rendered).to match %r{form.+"#{account_article_path(article)}".+".+method=\"post\"}
    expect(rendered).to match %r{form.+id="edit_article_#{article.id}"}
  end
end