# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
if(User.all.empty?)
  user1 = User.new(name: 'John',email: 'john@todolist.com', password: '12345678', password_confirmation: '12345678')
  user1.save!
  user2 = User.new(name: 'Marry',email: 'marry@todolist.com', password: '12345678', password_confirmation: '12345678')
  user2.save!
end
if(List.all.empty?)
  User.all.each do |u|
    list1 = List.create({title: 'Go to Walmart', user_id: u.id})
    list2 = List.create({title: 'Prepare for Midterm', user_id: u.id})
  end
end
if(Item.all.empty?)
  List.all.each_with_index do |l,i|
    item1 = Item.create({title: "to do #{i+1}", state: 'not started', list_id: l.id})
    item2 = Item.create({title: "to do #{i+1}", state: 'in progress', list_id: l.id})
    item3 = Item.create({title: "to do #{i+1}", state: 'complete', list_id: l.id})
  end
end

