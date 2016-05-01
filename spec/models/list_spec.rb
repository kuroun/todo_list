require 'rails_helper'

RSpec.describe List, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  #test association
  it "should belong to user" do
    list = List.reflect_on_association(:user)
    list.macro.should == :belongs_to
  end
  it "should has many items" do
    list = List.reflect_on_association(:items)
    list.macro.should == :has_many
  end
  it "invalid without title" do
    list = List.create(:user_id => 1,:description => "hello")
    expect(list).to_not be_valid
  end
  it 'invalid without user id' do
    list = List.create(:title => "list 1", :description => "hello")
    expect(list).to_not be_valid
  end
  it "should have items dependent by destroy all" do
    list = List.create(:title => 'list 1', :user_id => 1)
    item = Item.create(:list_id => list.id, :title => 'item 1')
    before =  Item.count
    list.destroy
    after = Item.count
    expect(before).to_not be_equal after
  end
end
