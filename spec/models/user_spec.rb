require 'rails_helper'

RSpec.describe User, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  #test association
  it "should have many lists" do
    user = User.reflect_on_association(:lists)
    user.macro.should == :has_many
  end
end
