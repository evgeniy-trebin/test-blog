require 'rails_helper'

RSpec.describe "account/articles/new", type: :view do
  before(:each) do
    assign(:article, build(:article))
  end

  it "renders new article form" do
    render

    assert_select "form[action=?][method=?]", account_articles_path, "post" do
    end
  end
end
