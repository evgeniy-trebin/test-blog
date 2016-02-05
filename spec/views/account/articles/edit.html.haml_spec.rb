require 'rails_helper'

RSpec.describe "account/articles/edit", type: :view do
  before(:each) do
    @article = assign(:article, create(:article))
  end

  it "renders the edit article form" do
    render

    assert_select "form[action=?][method=?]", account_article_path(@article), "post" do
    end
  end
end
