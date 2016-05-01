require 'rails_helper'

RSpec.describe User, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  #test association
  it "should have many lists" do
    user = User.reflect_on_association(:lists)
    user.macro.should == :has_many
  end
  it "should have lists dependent by destroy all" do
    user = User.create(:name => 'gg', :email => 'gg@email.com', :password => '12345678', :password_confirmation => '12345678')
    list = List.create(:title => 'list 1', :user_id => user.id)
    before = List.count
    user.destroy
    after = List.count
    expect(before).to_not be_equal after
  end
  
end
