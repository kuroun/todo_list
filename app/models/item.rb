class Item < ActiveRecord::Base
	belongs_to :list
	validates :title, :list_id, :presence => true
	scope :all_items, -> (id) {where("list_id IN (?)", List.select(:id).where("user_id =?", id))}
end
