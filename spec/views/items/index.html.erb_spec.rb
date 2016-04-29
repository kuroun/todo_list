require 'rails_helper'

RSpec.describe "items/index", type: :view do
  before(:each) do
    assign(:items, [
      Item.create!(
        :title => "Title",
        :state => "State",
        :note => "Note",
        :list_id => 1
      ),
      Item.create!(
        :title => "Title",
        :state => "State",
        :note => "Note",
        :list_id => 1
      )
    ])
  end

  it "renders a list of items" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "State".to_s, :count => 2
    assert_select "tr>td", :text => "Note".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
