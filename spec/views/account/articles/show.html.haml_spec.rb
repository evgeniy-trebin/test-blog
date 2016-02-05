require 'rails_helper'

RSpec.describe "account/articles/show", type: :view do
  before(:each) do
    @article = assign(:article, create(:article))
  end

  it "renders attributes in <p>" do
    render
  end
end
