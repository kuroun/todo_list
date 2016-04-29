require 'rails_helper'

RSpec.describe "items/show", type: :view do
  before(:each) do
    @item = assign(:item, Item.create!(
      :title => "Title",
      :state => "State",
      :note => "Note",
      :list_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/State/)
    expect(rendered).to match(/Note/)
    expect(rendered).to match(/1/)
  end
end
