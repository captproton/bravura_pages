require 'rails_helper'

RSpec.describe "static_pages/index", type: :view do
  before(:each) do
    assign(:static_pages, [
      StaticPage.create!(
        account: nil,
        title: "Title",
        content: "MyText"
      ),
      StaticPage.create!(
        account: nil,
        title: "Title",
        content: "MyText"
      )
    ])
  end

  it "renders a list of static_pages" do
    render
    cell_selector = 'div>p'
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Title".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("MyText".to_s), count: 2
  end
end
