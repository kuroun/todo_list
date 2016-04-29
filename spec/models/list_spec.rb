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
end
