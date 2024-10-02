require 'rails_helper'

RSpec.describe "static_pages/show", type: :view do
  before(:each) do
    assign(:static_page, StaticPage.create!(
      account: nil,
      title: "Title",
      content: "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
  end
end
