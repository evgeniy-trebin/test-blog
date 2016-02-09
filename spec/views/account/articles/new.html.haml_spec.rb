require 'rails_helper'

RSpec.describe 'account/articles/new', type: :view do

  it 'renders new article form' do
    def view.article
      Article.new
    end
    render
    expect(rendered).to match %r{form.+id="new_article".+action=\"#{account_articles_path}".+accept-charset=\"UTF-8\".+method=\"post\"}
  end

end