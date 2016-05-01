require 'rails_helper'

RSpec.describe Item, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  #test assocation
  it "should belong to list" do 
    item = Item.reflect_on_association(:list)
    item.macro.should ==  :belongs_to
  end
   it "invalid without title" do
    item = Item.create(:list_id => 1,:state=> "not started",:note => "hello")
    expect(item).to_not be_valid
  end
  it 'invalid without list id' do
    item = Item.create(:title => "item 1", :note => "hello")
    expect(item).to_not be_valid
  end
  
end
