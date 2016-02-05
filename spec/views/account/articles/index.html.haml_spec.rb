require 'rails_helper'

RSpec.describe "account/articles/index", type: :view do
  before(:each) do
    assign(:articles, [
                                create(:article),
                                create(:article)
                            ])
  end

  it "renders a list of account/articles" do
    render
  end
end
