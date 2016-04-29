require 'rails_helper'

RSpec.describe "items/new", type: :view do
  before(:each) do
    assign(:item, Item.new(
      :title => "MyString",
      :state => "MyString",
      :note => "MyString",
      :list_id => 1
    ))
  end

  it "renders new item form" do
    render

    assert_select "form[action=?][method=?]", items_path, "post" do

      assert_select "input#item_title[name=?]", "item[title]"

      assert_select "input#item_state[name=?]", "item[state]"

      assert_select "input#item_note[name=?]", "item[note]"

      assert_select "input#item_list_id[name=?]", "item[list_id]"
    end
  end
end
