require 'rails_helper'

RSpec.describe Item, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  #test assocation
  it "should belong to list" do 
    item = Item.reflect_on_association(:list)
    item.macro.should ==  :belong_to
  end
end
