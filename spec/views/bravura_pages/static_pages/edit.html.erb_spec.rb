require 'rails_helper'

RSpec.describe "static_pages/edit", type: :view do
  let(:static_page) {
    StaticPage.create!(
      account: nil,
      title: "MyString",
      content: "MyText"
    )
  }

  before(:each) do
    assign(:static_page, static_page)
  end

  it "renders the edit static_page form" do
    render

    assert_select "form[action=?][method=?]", static_page_path(static_page), "post" do
      assert_select "input[name=?]", "static_page[account_id]"

      assert_select "input[name=?]", "static_page[title]"

      assert_select "textarea[name=?]", "static_page[content]"
    end
  end
end
